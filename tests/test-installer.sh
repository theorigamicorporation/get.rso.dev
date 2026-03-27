#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# test-installer.sh — Test installer scripts across distros using Podman
# Usage: sh tests/test-installer.sh [--script=get-jq] [--image=ubuntu:24.04]
# =============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)/sh"
PASSED=0
FAILED=0
SKIPPED=0
RESULTS=""

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

SCRIPTS="
get-jq.sh
get-yq.sh
"

SHELLS="sh bash dash zsh"

###########################
# Functions
###########################
log() {
    printf "${BLUE}[TEST]${NC} %s\n" "$1"
}

pass() {
    printf "${GREEN}[PASS]${NC} %s\n" "$1"
    PASSED=$(( PASSED + 1 ))
    RESULTS="${RESULTS}PASS: $1\n"
}

fail() {
    printf "${RED}[FAIL]${NC} %s\n" "$1"
    FAILED=$(( FAILED + 1 ))
    RESULTS="${RESULTS}FAIL: $1\n"
}

skip() {
    printf "${YELLOW}[SKIP]${NC} %s\n" "$1"
    SKIPPED=$(( SKIPPED + 1 ))
    RESULTS="${RESULTS}SKIP: $1\n"
}

# Check if podman is available
check_podman() {
    if ! command -v podman >/dev/null 2>&1; then
        printf "${RED}Error: podman is not installed${NC}\n" >&2
        exit 1
    fi
}

# Run a script inside a container
# Args: $1=image, $2=script, $3=extra_args
run_in_container() {
    _image="$1"
    _script="$2"
    _args="${3:-}"
    _script_path="${SCRIPT_DIR}/${_script}"

    if [ ! -f "$_script_path" ]; then
        skip "${_image} | ${_script} — script not found"
        return 1
    fi

    podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "sh /scripts/${_script} ${_args}" 2>&1
}

###########################
# Test Cases
###########################

# Test 1: --help exits 0
test_help() {
    _image="$1"
    _script="$2"
    _test_name="${_image} | ${_script} | --help"

    log "Testing: $_test_name"
    if run_in_container "$_image" "$_script" "--help" >/dev/null 2>&1; then
        pass "$_test_name"
    else
        fail "$_test_name"
    fi
}

# Test 2: Default install (non-interactive)
test_default_install() {
    _image="$1"
    _script="$2"
    _tool_cmd="$3"
    _test_name="${_image} | ${_script} | default install"

    log "Testing: $_test_name"
    _output=$(podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "sh /scripts/${_script} && command -v ${_tool_cmd}" 2>&1) || true

    if printf '%s' "$_output" | grep -q "$_tool_cmd"; then
        pass "$_test_name"
    else
        fail "$_test_name"
        printf "  Output: %s\n" "$_output"
    fi
}

# Test 3: --method=github-release
test_github_release() {
    _image="$1"
    _script="$2"
    _tool_cmd="$3"
    _test_name="${_image} | ${_script} | --method=github-release"

    log "Testing: $_test_name"
    _output=$(podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "
            # Ensure curl is available (some minimal images lack it)
            command -v curl >/dev/null 2>&1 || {
                command -v apt-get >/dev/null 2>&1 && apt-get update -qq && apt-get install -y -qq curl
                command -v dnf >/dev/null 2>&1 && dnf install -y -q curl
                command -v yum >/dev/null 2>&1 && yum install -y -q curl
            }
            sh /scripts/${_script} --method=github-release && command -v ${_tool_cmd}
        " 2>&1) || true

    if printf '%s' "$_output" | grep -q "$_tool_cmd"; then
        pass "$_test_name"
    else
        fail "$_test_name"
        printf "  Output: %s\n" "$_output"
    fi
}

# Test 4: --force reinstall
test_force() {
    _image="$1"
    _script="$2"
    _tool_cmd="$3"
    _test_name="${_image} | ${_script} | --force reinstall"

    log "Testing: $_test_name"
    _output=$(podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "sh /scripts/${_script} && sh /scripts/${_script} --force && ${_tool_cmd} --version" 2>&1) || true

    if printf '%s' "$_output" | grep -qi "version\|${_tool_cmd}"; then
        pass "$_test_name"
    else
        fail "$_test_name"
        printf "  Output: %s\n" "$_output"
    fi
}

# Test 5: --update when already up to date
test_update_noop() {
    _image="$1"
    _script="$2"
    _test_name="${_image} | ${_script} | --update (already up to date)"

    log "Testing: $_test_name"
    _output=$(podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "sh /scripts/${_script} && sh /scripts/${_script} --update" 2>&1) || true

    if printf '%s' "$_output" | grep -qi "up to date\|already installed"; then
        pass "$_test_name"
    else
        fail "$_test_name"
        printf "  Output: %s\n" "$_output"
    fi
}

# Test: Shell compatibility (run --help under different shells)
test_shell_compat() {
    _image="$1"
    _script="$2"
    _shell="$3"
    _test_name="${_image} | ${_script} | shell: ${_shell}"

    log "Testing: $_test_name"
    _output=$(podman run --rm \
        -v "${SCRIPT_DIR}:/scripts:ro" \
        "$_image" \
        sh -c "
            if command -v ${_shell} >/dev/null 2>&1; then
                ${_shell} /scripts/${_script} --help
            else
                echo 'SHELL_NOT_AVAILABLE'
            fi
        " 2>&1) || true

    if printf '%s' "$_output" | grep -q "SHELL_NOT_AVAILABLE"; then
        skip "$_test_name — ${_shell} not available"
    elif printf '%s' "$_output" | grep -qi "usage\|options\|install"; then
        pass "$_test_name"
    else
        fail "$_test_name"
        printf "  Output: %s\n" "$_output"
    fi
}

###########################
# Argument Parsing
###########################
FILTER_SCRIPT=""
FILTER_IMAGE=""
SKIP_INSTALL=false

while [ $# -gt 0 ]; do
    case "$1" in
        --script=*)  FILTER_SCRIPT="${1#*=}"; shift ;;
        --image=*)   FILTER_IMAGE="${1#*=}"; shift ;;
        --help-only) SKIP_INSTALL=true; shift ;;
        --help|-h)
            printf "Usage: test-installer.sh [OPTIONS]\n"
            printf "  --script=NAME   Only test a specific script (e.g., get-jq.sh)\n"
            printf "  --image=IMAGE   Only test on a specific image (e.g., ubuntu:24.04)\n"
            printf "  --help-only     Only run --help tests (fast, no installs)\n"
            exit 0 ;;
        *) printf "Unknown option: %s\n" "$1"; exit 1 ;;
    esac
done

###########################
# Main
###########################
check_podman

printf "\n${BLUE}========================================${NC}\n"
printf "${BLUE} get.rso.dev Installer Test Suite${NC}\n"
printf "${BLUE}========================================${NC}\n\n"

for image in $IMAGES; do
    [ -z "$image" ] && continue

    # Filter by image if specified
    if [ -n "$FILTER_IMAGE" ]; then
        case "$image" in
            *"$FILTER_IMAGE"*) ;;
            *) continue ;;
        esac
    fi

    printf "\n${YELLOW}--- %s ---${NC}\n" "$image"

    for script in $SCRIPTS; do
        [ -z "$script" ] && continue

        # Filter by script if specified
        if [ -n "$FILTER_SCRIPT" ]; then
            case "$script" in
                *"$FILTER_SCRIPT"*) ;;
                *) continue ;;
            esac
        fi

        # Derive tool command from script name
        tool_cmd=$(printf '%s' "$script" | sed 's/^get-//; s/\.sh$//')

        # Always run help test
        test_help "$image" "$script"

        if [ "$SKIP_INSTALL" = false ]; then
            test_default_install "$image" "$script" "$tool_cmd"
            test_github_release "$image" "$script" "$tool_cmd"
            test_force "$image" "$script" "$tool_cmd"
            test_update_noop "$image" "$script" "$tool_cmd"
        fi
    done

    # Shell compatibility tests (only on one image to save time)
    case "$image" in
        *ubuntu:24.04*)
            for script in $SCRIPTS; do
                [ -z "$script" ] && continue
                if [ -n "$FILTER_SCRIPT" ]; then
                    case "$script" in
                        *"$FILTER_SCRIPT"*) ;;
                        *) continue ;;
                    esac
                fi
                for shell in $SHELLS; do
                    test_shell_compat "$image" "$script" "$shell"
                done
            done
            ;;
    esac
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
