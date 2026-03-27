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
set -e

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

###########################
# Test Cases
###########################

# Test: --help exits 0
test_help() {
    _image="$1"; _script="$2"
    _name="${_image} | ${_script} | --help"
    log "Testing: $_name"
    if run_container "$_image" "sh /scripts/${_script} --help" >/dev/null 2>&1; then
        pass "$_name"
    else
        fail "$_name"
    fi
}

# Test: default install (auto-detect method)
test_default_install() {
    _image="$1"; _script="$2"; _tool="$3"; _verify="$4"
    _name="${_image} | ${_script} | default install"
    _verify_cmd="${_verify:-command -v ${_tool}}"
    log "Testing: $_name"
    _output=$(run_container "$_image" "sh /scripts/${_script} && ${_verify_cmd}" 2>&1) || true
    if [ $? -eq 0 ] && [ -n "$_output" ]; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 5 lines):\n"
        printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
    fi
}

# Test: install with specific --method
test_method_install() {
    _image="$1"; _script="$2"; _tool="$3"; _method="$4"; _verify="$5"
    _name="${_image} | ${_script} | --method=${_method}"
    _verify_cmd="${_verify:-command -v ${_tool}}"
    log "Testing: $_name"

    # Some methods need prereqs in minimal containers
    _prereqs=""
    case "$_method" in
        github-release)
            _prereqs="command -v curl >/dev/null 2>&1 || { command -v apt-get >/dev/null 2>&1 && apt-get update -qq && apt-get install -y -qq curl; command -v dnf >/dev/null 2>&1 && dnf install -y -q curl; command -v yum >/dev/null 2>&1 && yum install -y -q curl; } 2>/dev/null; " ;;
    esac

    _output=$(run_container "$_image" "${_prereqs}sh /scripts/${_script} --method=${_method} && ${_verify_cmd}" 2>&1) || true
    if [ $? -eq 0 ] && printf '%s' "$_output" | grep -qiv "not available\|not found\|No such"; then
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
# Assert scripts receive: $1=script_name $2=image $3=method (or "default")
test_asserts() {
    _image="$1"; _script="$2"; _assert_name="$3"; _method="${4:-default}"
    _name="${_image} | ${_script} | asserts (${_method})"
    _install_cmd="sh /scripts/${_script}"
    [ "$_method" != "default" ] && _install_cmd="sh /scripts/${_script} --method=${_method}"

    # Prereqs for methods that need them
    _prereqs=""
    case "$_method" in
        github-release)
            _prereqs="command -v curl >/dev/null 2>&1 || { command -v apt-get >/dev/null 2>&1 && apt-get update -qq && apt-get install -y -qq curl; command -v dnf >/dev/null 2>&1 && dnf install -y -q curl; command -v yum >/dev/null 2>&1 && yum install -y -q curl; } 2>/dev/null; " ;;
    esac

    log "Testing: $_name"
    _output=$(run_container "$_image" "${_prereqs}${_install_cmd} && sh /asserts/${_assert_name} ${_script} ${_image} ${_method}" 2>&1) || true
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
    _image="$1"; _script="$2"; _tool="$3"
    _name="${_image} | ${_script} | --update (already up to date)"
    log "Testing: $_name"
    _output=$(run_container "$_image" "sh /scripts/${_script} && sh /scripts/${_script} --update" 2>&1) || true
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
    _image="$1"; _script="$2"; _tool="$3"
    _name="${_image} | ${_script} | --force reinstall"
    log "Testing: $_name"
    _output=$(run_container "$_image" "sh /scripts/${_script} && sh /scripts/${_script} --force && ${_tool} --version" 2>&1) || true
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
        assert_script=$(get_assert_script "$script")
        assert_name=""
        [ -n "$assert_script" ] && assert_name=$(basename "$assert_script")

        # Always test --help
        test_help "$image" "$script"

        [ "$HELP_ONLY" = true ] && continue

        # Check if this is an installer script (has @methods)
        methods=$(get_script_methods "$script_path")
        is_installer=false
        [ -n "$methods" ] && is_installer=true

        if [ -n "$FILTER_METHOD" ]; then
            test_method_install "$image" "$script" "$tool_cmd" "$FILTER_METHOD" "$verify_cmd"
        elif [ "$ALL_METHODS" = true ] && [ "$is_installer" = true ]; then
            for method in $methods; do
                test_method_install "$image" "$script" "$tool_cmd" "$method" "$verify_cmd"
            done
        elif [ "$is_installer" = true ]; then
            # Installer scripts: test install, update, force
            test_default_install "$image" "$script" "$tool_cmd" "$verify_cmd"
            test_update_noop "$image" "$script" "$tool_cmd"
            test_force_reinstall "$image" "$script" "$tool_cmd"
        else
            # Non-installer scripts: just run and verify
            test_default_install "$image" "$script" "$tool_cmd" "$verify_cmd"
        fi

        # Run custom asserts if they exist
        if [ -n "$assert_name" ] && [ "$HELP_ONLY" = false ]; then
            if [ -n "$FILTER_METHOD" ]; then
                test_asserts "$image" "$script" "$assert_name" "$FILTER_METHOD"
            else
                test_asserts "$image" "$script" "$assert_name" "default"
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
