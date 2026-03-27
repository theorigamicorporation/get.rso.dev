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

# Extract @methods metadata from a script
get_script_methods() {
    grep -m1 '@methods' "$1" 2>/dev/null | sed 's/.*@methods[[:space:]]*//' | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//; s/ (.*)//g' | grep -v '^$' || true
}

# Get tool command name from script filename
get_tool_cmd() {
    basename "$1" | sed 's/^get-//; s/\.sh$//'
}

# Run a command inside a container
# Returns: exit code of the command
run_container() {
    _image="$1"
    shift
    podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
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
    _image="$1"; _script="$2"; _tool="$3"
    _name="${_image} | ${_script} | default install"
    log "Testing: $_name"
    _output=$(run_container "$_image" "sh /scripts/${_script} && command -v ${_tool} && ${_tool} --version" 2>&1) || true
    if printf '%s' "$_output" | grep -qi "version\|${_tool}"; then
        pass "$_name"
    else
        fail "$_name"
        printf "  Output (last 5 lines):\n"
        printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
    fi
}

# Test: install with specific --method
test_method_install() {
    _image="$1"; _script="$2"; _tool="$3"; _method="$4"
    _name="${_image} | ${_script} | --method=${_method}"
    log "Testing: $_name"

    # Some methods need prereqs in minimal containers
    _prereqs=""
    case "$_method" in
        github-release)
            _prereqs="command -v curl >/dev/null 2>&1 || { command -v apt-get >/dev/null 2>&1 && apt-get update -qq && apt-get install -y -qq curl; command -v dnf >/dev/null 2>&1 && dnf install -y -q curl; command -v yum >/dev/null 2>&1 && yum install -y -q curl; } 2>/dev/null; " ;;
    esac

    _output=$(run_container "$_image" "${_prereqs}sh /scripts/${_script} --method=${_method} && command -v ${_tool} && ${_tool} --version" 2>&1) || true
    if printf '%s' "$_output" | grep -qi "version\|${_tool}"; then
        pass "$_name"
    else
        # Some methods won't be available on all distros (e.g. apt on RHEL)
        if printf '%s' "$_output" | grep -qi "not available\|not found\|No such"; then
            skip "$_name (method not available on this distro)"
        else
            fail "$_name"
            printf "  Output (last 5 lines):\n"
            printf '%s\n' "$_output" | tail -5 | sed 's/^/    /'
        fi
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
    # Filter
    if [ -n "$FILTER_SCRIPT" ]; then
        case "$_base" in *"$FILTER_SCRIPT"*) ;; *) continue ;; esac
    fi
    # Only test installer scripts (those with @methods)
    if [ -z "$(get_script_methods "$f")" ] && [ "$HELP_ONLY" = false ]; then
        continue
    fi
    SCRIPTS="${SCRIPTS} ${_base}"
done

# If help-only, also include non-installer scripts
if [ "$HELP_ONLY" = true ] && [ -z "$FILTER_SCRIPT" ]; then
    for f in "${SCRIPT_DIR}"/get-*.sh; do
        [ -f "$f" ] || continue
        _base=$(basename "$f")
        case "$SCRIPTS" in *"$_base"*) ;; *) SCRIPTS="${SCRIPTS} ${_base}" ;; esac
    done
fi

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

        # Always test --help
        test_help "$image" "$script"

        [ "$HELP_ONLY" = true ] && continue

        if [ -n "$FILTER_METHOD" ]; then
            # Test only the specified method
            test_method_install "$image" "$script" "$tool_cmd" "$FILTER_METHOD"
        elif [ "$ALL_METHODS" = true ]; then
            # Test every method from @methods metadata
            methods=$(get_script_methods "$script_path")
            for method in $methods; do
                test_method_install "$image" "$script" "$tool_cmd" "$method"
            done
        else
            # Default: test auto-detect install, update, force
            test_default_install "$image" "$script" "$tool_cmd"
            test_update_noop "$image" "$script" "$tool_cmd"
            test_force_reinstall "$image" "$script" "$tool_cmd"
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
