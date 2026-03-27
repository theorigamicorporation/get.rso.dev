#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# test-installer.sh — Test installer scripts across distros using Podman
#
# Usage:
#   sh tests/test-installer.sh                          # Test all scripts, all distros
#   sh tests/test-installer.sh --script=get-jq          # Test specific script
#   sh tests/test-installer.sh --image=ubuntu:24.04     # Test specific distro
#   sh tests/test-installer.sh --method=github-release  # Test specific method
#   sh tests/test-installer.sh --help-only              # Quick: only test --help
#   sh tests/test-installer.sh --all-methods             # Test every method per script
# =============================================================================
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCRIPT_DIR="${REPO_ROOT}/sh"
PASSED=0
FAILED=0
SKIPPED=0

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# Test matrix
IMAGES="
docker.io/library/ubuntu:22.04
docker.io/library/ubuntu:24.04
docker.io/library/ubuntu:25.04
docker.io/library/debian:12
docker.io/library/debian:13
docker.io/rockylinux/rockylinux:9
docker.io/rockylinux/rockylinux:10
docker.io/amazonlinux:2023
"

###########################
# Functions
###########################
log()  { printf "${BLUE}[TEST]${NC} %s\n" "$1"; }
pass() { printf "${GREEN}[PASS]${NC} %s\n" "$1"; PASSED=$(( PASSED + 1 )); }
fail() { printf "${RED}[FAIL]${NC} %s\n" "$1"; FAILED=$(( FAILED + 1 )); }
skip() { printf "${YELLOW}[SKIP]${NC} %s\n" "$1"; SKIPPED=$(( SKIPPED + 1 )); }

check_podman() {
    if ! command -v podman >/dev/null 2>&1; then
        printf "${RED}Error: podman is not installed${NC}\n" >&2
        exit 1
    fi
}

# Extract metadata from a script
get_script_methods() {
    grep -m1 '@methods' "$1" 2>/dev/null | sed 's/.*@methods[[:space:]]*//' | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//; s/ (.*)//g' | grep -v '^$' || true
}

get_script_verify() {
    grep -m1 '@verify' "$1" 2>/dev/null | sed 's/.*@verify[[:space:]]*//' || true
}

get_script_prereqs() {
    grep -m1 '@prereqs' "$1" 2>/dev/null | sed 's/.*@prereqs[[:space:]]*//' | sed 's/ (.*)//' || true
}

get_script_noroot() {
    grep -m1 '@noroot' "$1" 2>/dev/null | sed 's/.*@noroot[[:space:]]*//' || true
}

# Detect interpreter from shebang (sh or bash)
get_script_shell() {
    _shebang=$(head -1 "$1" 2>/dev/null)
    case "$_shebang" in
        *bash*) printf 'bash' ;;
        *)      printf 'sh' ;;
    esac
}

# Get tool command name from script filename
get_tool_cmd() {
    basename "$1" | sed 's/^get-//; s/\.sh$//'
}

# Check if custom assert script exists for a script
get_assert_script() {
    _script_name=$(basename "$1" | sed 's/\.sh$//')
    _assert="${REPO_ROOT}/tests/asserts/${_script_name}.sh"
    if [ -f "$_assert" ]; then
        printf '%s' "$_assert"
    fi
}

# Generate shell commands to install prereqs inside a container
# Reads @prereqs tag and produces apt-get/dnf/yum install commands
prereqs_install_cmd() {
    _prereqs="$1"
    [ -z "$_prereqs" ] && return

    # Parse prereqs: "curl|wget, gpg" means (curl OR wget) AND gpg
    _apt_pkgs=""
    _dnf_pkgs=""

    _old_ifs="$IFS"; IFS=','
    for _item in $_prereqs; do
        _item=$(printf '%s' "$_item" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//; s/ (.*)//g')
        [ -z "$_item" ] && continue

        # Handle OR (pipe): "curl|wget" — install first available or first option
        case "$_item" in
            *"|"*)
                _first=$(printf '%s' "$_item" | cut -d'|' -f1)
                _apt_pkgs="${_apt_pkgs} ${_first}"
                _dnf_pkgs="${_dnf_pkgs} ${_first}"
                ;;
            "gpg")
                _apt_pkgs="${_apt_pkgs} gpg"
                _dnf_pkgs="${_dnf_pkgs} gnupg2"
                ;;
            "software-properties-common")
                _apt_pkgs="${_apt_pkgs} software-properties-common"
                ;;
            *)
                _apt_pkgs="${_apt_pkgs} ${_item}"
                _dnf_pkgs="${_dnf_pkgs} ${_item}"
                ;;
        esac
    done
    IFS="$_old_ifs"

    [ -z "$_apt_pkgs" ] && [ -z "$_dnf_pkgs" ] && return

    # Generate install command with ca-certificates always included
    printf 'if command -v apt-get >/dev/null 2>&1; then apt-get update -qq && apt-get install -y -qq ca-certificates%s >/dev/null 2>&1; ' "$_apt_pkgs"
    printf 'elif command -v dnf >/dev/null 2>&1; then dnf install -y -q ca-certificates%s >/dev/null 2>&1; ' "$_dnf_pkgs"
    printf 'elif command -v yum >/dev/null 2>&1; then yum install -y -q ca-certificates%s >/dev/null 2>&1; fi; ' "$_dnf_pkgs"
}

# Run a command inside a container
# Returns: exit code of the command
run_container() {
    _image="$1"
    shift
    podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        -v "${REPO_ROOT}/tests/asserts:/asserts:ro" \
        "$_image" \
        sh -c "$*" 2>&1
}

# Run a command as a non-root user inside a container
# For scripts with @noroot true (e.g. rustup)
# Args: $1=image, $2=prereqs_cmd (run as root), remaining=user command (run as testuser)
# Copies scripts inside the container to avoid UID mapping issues with -v mounts
run_container_noroot() {
    _image="$1"
    _root_cmd="$2"
    shift 2
    _user_cmd="$*"

    # Encode commands in base64 to avoid shell quoting nightmares
    _encoded_root=$(printf '%s' "$_root_cmd" | base64 -w0)
    _encoded_user=$(printf '%s' "$_user_cmd" | base64 -w0)

    podman run --rm \
        -v "${SCRIPT_DIR}:/hostscripts:ro" \
        -v "${REPO_ROOT}/tests/asserts:/hostasserts:ro" \
        "$_image" \
        sh -c "
            # Copy scripts inside container so testuser can read them
            cp -r /hostscripts /scripts 2>/dev/null || true
            cp -r /hostasserts /asserts 2>/dev/null || true
            chmod -R 755 /scripts /asserts 2>/dev/null || true

            # Install su/useradd if missing (minimal images like amazonlinux)
            if ! command -v su >/dev/null 2>&1 || ! command -v useradd >/dev/null 2>&1; then
                if command -v apt-get >/dev/null 2>&1; then
                    apt-get update -qq && apt-get install -y -qq login >/dev/null 2>&1
                elif command -v dnf >/dev/null 2>&1; then
                    dnf install -y -q util-linux shadow-utils >/dev/null 2>&1
                elif command -v yum >/dev/null 2>&1; then
                    yum install -y -q util-linux shadow-utils >/dev/null 2>&1
                fi
            fi

            # Run prereqs install as root
            printf '%s' '${_encoded_root}' | base64 -d > /tmp/rootcmd.sh
            chmod 755 /tmp/rootcmd.sh
            sh /tmp/rootcmd.sh

            # Create non-root test user
            if command -v useradd >/dev/null 2>&1; then
                useradd -m testuser 2>/dev/null || true
            elif command -v adduser >/dev/null 2>&1; then
                adduser -D testuser 2>/dev/null || true
            fi

            # Decode and write the user command with PATH setup
            # Pre-add common user binary paths so verify/update commands work
            # after installs that modify PATH (e.g. rustup adds ~/.cargo/bin)
            printf '#!/bin/sh\nexport PATH=\"\$HOME/.cargo/bin:\$HOME/.local/bin:\$PATH\"\n' > /tmp/testcmd.sh
            printf '%s' '${_encoded_user}' | base64 -d >> /tmp/testcmd.sh
            chmod 755 /tmp/testcmd.sh

            # Run as testuser
            su testuser -s /bin/sh -c 'sh /tmp/testcmd.sh'
        " 2>&1
}

###########################
# Test Cases
###########################

# Test: --help exits 0
test_help() {
    _image="$1"; _script="$2"; _shell="${3:-sh}"; _noroot="${4:-false}"; _pcmd="${5:-}"
    _name="${_image} | ${_script} | --help"
    log "Testing: $_name"
    _cmd="${_shell} /scripts/${_script} --help"
    if [ "$_noroot" = true ]; then
        _result=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) && _rc=0 || _rc=$?
    else
        _result=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) && _rc=0 || _rc=$?
    fi
    if [ "$_rc" -eq 0 ]; then
        pass "$_name"
    else
        fail "$_name"
    fi
}

# Test: run script (and optionally verify with @verify command)
test_default_install() {
    _image="$1"; _script="$2"; _tool="$3"; _verify="$4"; _shell="${5:-sh}"; _pcmd="${6:-}"; _noroot="${7:-false}"
    _name="${_image} | ${_script} | run"
    [ -n "$_verify" ] && _name="${_image} | ${_script} | run + verify"
    log "Testing: $_name"

    _cmd="${_shell} /scripts/${_script}"
    [ -n "$_verify" ] && _cmd="${_cmd} && ${_verify}"

    if [ "$_noroot" = true ]; then
        _output=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) && _exit=0 || _exit=$?
    else
        _output=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) && _exit=0 || _exit=$?
    fi
    if [ "$_exit" -eq 0 ]; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 5 lines):\n"
        printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
    fi
}

# Test: install with specific --method
test_method_install() {
    _image="$1"; _script="$2"; _tool="$3"; _method="$4"; _verify="$5"; _shell="${6:-sh}"; _pcmd="${7:-}"; _noroot="${8:-false}"
    _name="${_image} | ${_script} | --method=${_method}"
    _verify_cmd="${_verify:-command -v ${_tool}}"
    log "Testing: $_name"

    _cmd="${_shell} /scripts/${_script} --method=${_method} && ${_verify_cmd}"
    if [ "$_noroot" = true ]; then
        _output=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) && _rc=0 || _rc=$?
    else
        _output=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) && _rc=0 || _rc=$?
    fi
    if [ "$_rc" -eq 0 ] && printf '%s' "$_output" | grep -qiv "not available\|not found\|No such"; then
        pass "$_name"
    else
        if printf '%s' "$_output" | grep -qi "not available\|not found\|No such"; then
            skip "$_name (method not available on this distro)"
        else
            fail "$_name"
            printf "  Output (last 5 lines):\n"
            printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
        fi
    fi
}

# Test: custom assert script
# Environment variables available to assert scripts:
#   TEST_SCRIPT  — script being tested (always set)
#   TEST_IMAGE   — container image (always set)
#   TEST_METHOD  — install method (only set for installer scripts with --method)
#   TEST_PREREQS — comma-separated prereqs from @prereqs tag (always set if defined)
test_asserts() {
    _image="$1"; _script="$2"; _assert_name="$3"; _method="$4"; _shell="${5:-sh}"; _prereqs_meta="${6:-}"; _pcmd="${7:-}"; _noroot="${8:-false}"
    _label="asserts"
    [ -n "$_method" ] && _label="asserts (${_method})"
    _name="${_image} | ${_script} | ${_label}"

    _install_cmd="${_shell} /scripts/${_script}"
    [ -n "$_method" ] && _install_cmd="${_shell} /scripts/${_script} --method=${_method}"

    # Build env vars
    _env="export TEST_SCRIPT='${_script}' TEST_IMAGE='${_image}' TEST_PREREQS='${_prereqs_meta}';"
    [ -n "$_method" ] && _env="export TEST_SCRIPT='${_script}' TEST_IMAGE='${_image}' TEST_METHOD='${_method}' TEST_PREREQS='${_prereqs_meta}';"

    _cmd="${_env} ${_install_cmd} && sh /asserts/${_assert_name}"

    log "Testing: $_name"
    if [ "$_noroot" = true ]; then
        _output=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) || true
    else
        _output=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) || true
    fi
    if printf '%s' "$_output" | grep -qi "assertions passed\|All.*passed"; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 10 lines):\n"
        printf '%s\n' "$_output" | tail -10 | sed 's/^/    /'
    fi
}

# Test: --update when already up to date
test_update_noop() {
    _image="$1"; _script="$2"; _tool="$3"; _shell="${4:-sh}"; _pcmd="${5:-}"; _noroot="${6:-false}"
    _name="${_image} | ${_script} | --update (already up to date)"
    log "Testing: $_name"
    _cmd="${_shell} /scripts/${_script} && ${_shell} /scripts/${_script} --update"
    if [ "$_noroot" = true ]; then
        _output=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) || true
    else
        _output=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) || true
    fi
    if printf '%s' "$_output" | grep -qi "up to date\|already installed"; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 5 lines):\n"
        printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
    fi
}

# Test: --force reinstall
test_force_reinstall() {
    _image="$1"; _script="$2"; _tool="$3"; _shell="${4:-sh}"; _pcmd="${5:-}"; _noroot="${6:-false}"
    _name="${_image} | ${_script} | --force reinstall"
    log "Testing: $_name"
    _cmd="${_shell} /scripts/${_script} && ${_shell} /scripts/${_script} --force && ${_tool} --version"
    if [ "$_noroot" = true ]; then
        _output=$(run_container_noroot "$_image" "$_pcmd" "$_cmd" 2>&1) || true
    else
        _output=$(run_container "$_image" "${_pcmd}${_cmd}" 2>&1) || true
    fi
    if printf '%s' "$_output" | grep -qi "version\|${_tool}"; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 5 lines):\n"
        printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
    fi
}

###########################
# Argument Parsing
###########################
FILTER_SCRIPT=""
FILTER_IMAGE=""
FILTER_METHOD=""
HELP_ONLY=false
ALL_METHODS=false

while [ $# -gt 0 ]; do
    case "$1" in
        --script=*)    FILTER_SCRIPT="${1#*=}"; shift ;;
        --image=*)     FILTER_IMAGE="${1#*=}"; shift ;;
        --method=*)    FILTER_METHOD="${1#*=}"; shift ;;
        --help-only)   HELP_ONLY=true; shift ;;
        --all-methods) ALL_METHODS=true; shift ;;
        --help|-h)
            cat <<'USAGE'
Usage: test-installer.sh [OPTIONS]

Options:
  --script=NAME       Only test a specific script (e.g., get-jq.sh)
  --image=IMAGE       Only test on a specific image (e.g., ubuntu:24.04)
  --method=METHOD     Only test a specific method (e.g., github-release)
  --all-methods       Test every @methods entry per script per distro
  --help-only         Only run --help tests (fast, no actual installs)
  -h, --help          Show this help

Examples:
  sh tests/test-installer.sh --script=get-jq.sh --image=ubuntu:24.04
  sh tests/test-installer.sh --all-methods --image=debian:12
  sh tests/test-installer.sh --method=github-release
  sh tests/test-installer.sh --help-only
USAGE
            exit 0 ;;
        *) printf "Unknown option: %s\n" "$1"; exit 1 ;;
    esac
done

###########################
# Main
###########################
check_podman

# Collect scripts to test
SCRIPTS=""
for f in "${SCRIPT_DIR}"/get-*.sh; do
    [ -f "$f" ] || continue
    _base=$(basename "$f")
    if [ -n "$FILTER_SCRIPT" ]; then
        case "$_base" in *"$FILTER_SCRIPT"*) ;; *) continue ;; esac
    fi
    SCRIPTS="${SCRIPTS} ${_base}"
done

printf "\n${BLUE}========================================${NC}\n"
printf "${BLUE} get.rso.dev Installer Test Suite${NC}\n"
printf "${BLUE}========================================${NC}\n"
printf " Scripts: %s\n" "$(echo $SCRIPTS | tr ' ' ', ')"
printf " Mode:    %s\n" "$([ "$HELP_ONLY" = true ] && echo 'help-only' || ([ "$ALL_METHODS" = true ] && echo 'all-methods' || echo 'default'))"
[ -n "$FILTER_IMAGE" ] && printf " Image:   %s\n" "$FILTER_IMAGE"
[ -n "$FILTER_METHOD" ] && printf " Method:  %s\n" "$FILTER_METHOD"
printf "${BLUE}========================================${NC}\n\n"

for image in $IMAGES; do
    [ -z "$image" ] && continue

    # Image filter
    if [ -n "$FILTER_IMAGE" ]; then
        case "$image" in *"$FILTER_IMAGE"*) ;; *) continue ;; esac
    fi

    printf "\n${YELLOW}--- %s ---${NC}\n" "$image"

    for script in $SCRIPTS; do
        [ -z "$script" ] && continue
        tool_cmd=$(get_tool_cmd "$script")
        script_path="${SCRIPT_DIR}/${script}"
        verify_cmd=$(get_script_verify "$script_path")
        prereqs=$(get_script_prereqs "$script_path")
        prereqs_cmd=$(prereqs_install_cmd "$prereqs")
        shell_cmd=$(get_script_shell "$script_path")
        noroot=$(get_script_noroot "$script_path")
        assert_script=$(get_assert_script "$script")
        assert_name=""
        [ -n "$assert_script" ] && assert_name=$(basename "$assert_script")

        # Normalize noroot to boolean
        _is_noroot=false
        [ "$noroot" = "true" ] && _is_noroot=true

        # Test --help only if the script supports it
        if grep -q '\-\-help\|usage()' "$script_path" 2>/dev/null; then
            test_help "$image" "$script" "$shell_cmd" "$_is_noroot" "$prereqs_cmd"
        fi

        [ "$HELP_ONLY" = true ] && continue

        # Check if this is an installer script (has @methods)
        methods=$(get_script_methods "$script_path")
        is_installer=false
        [ -n "$methods" ] && is_installer=true

        if [ -n "$FILTER_METHOD" ] && [ "$is_installer" = true ]; then
            test_method_install "$image" "$script" "$tool_cmd" "$FILTER_METHOD" "$verify_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
        elif [ "$ALL_METHODS" = true ] && [ "$is_installer" = true ]; then
            for method in $methods; do
                test_method_install "$image" "$script" "$tool_cmd" "$method" "$verify_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
            done
        elif [ "$is_installer" = true ]; then
            test_default_install "$image" "$script" "$tool_cmd" "$verify_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
            test_update_noop "$image" "$script" "$tool_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
            test_force_reinstall "$image" "$script" "$tool_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
        else
            test_default_install "$image" "$script" "$tool_cmd" "$verify_cmd" "$shell_cmd" "$prereqs_cmd" "$_is_noroot"
        fi

        # Run custom asserts if they exist
        if [ -n "$assert_name" ] && [ "$HELP_ONLY" = false ]; then
            if [ -n "$FILTER_METHOD" ] && [ "$is_installer" = true ]; then
                test_asserts "$image" "$script" "$assert_name" "$FILTER_METHOD" "$shell_cmd" "$prereqs" "$prereqs_cmd" "$_is_noroot"
            else
                test_asserts "$image" "$script" "$assert_name" "" "$shell_cmd" "$prereqs" "$prereqs_cmd" "$_is_noroot"
            fi
        fi
    done
done

###########################
# Summary
###########################
printf "\n${BLUE}========================================${NC}\n"
printf "${BLUE} Test Summary${NC}\n"
printf "${BLUE}========================================${NC}\n"
printf "${GREEN}Passed:  %d${NC}\n" "$PASSED"
printf "${RED}Failed:  %d${NC}\n" "$FAILED"
printf "${YELLOW}Skipped: %d${NC}\n" "$SKIPPED"
printf "Total:   %d\n" "$(( PASSED + FAILED + SKIPPED ))"
printf "${BLUE}========================================${NC}\n\n"

if [ "$FAILED" -gt 0 ]; then
    printf "${RED}Some tests failed!${NC}\n"
    exit 1
fi

printf "${GREEN}All tests passed!${NC}\n"
exit 0
