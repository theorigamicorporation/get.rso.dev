#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-yq.sh
# Runs inside the test container AFTER the installer has completed.
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested (e.g. get-yq.sh)
#   TEST_IMAGE   — container image (e.g. docker.io/library/ubuntu:24.04)
#   TEST_METHOD  — install method used (e.g. apt, github-release, or "default")
#
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# Install prereqs for github-release method (needs curl or wget)
if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    echo "Installing prereq: curl..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update -qq && apt-get install -y -qq curl >/dev/null 2>&1
    elif command -v dnf >/dev/null 2>&1; then
        dnf install -y -q curl >/dev/null 2>&1
    elif command -v yum >/dev/null 2>&1; then
        yum install -y -q curl >/dev/null 2>&1
    fi
fi

echo "Assert: yq binary exists"
command -v yq

echo "Assert: yq --version outputs version string"
yq --version | grep -qi 'version'

echo "Assert: yq can parse YAML"
result=$(printf 'name: test\n' | yq '.name')
[ "$result" = "test" ]

echo "Assert: yq can parse JSON"
result=$(echo '{"key":"value"}' | yq -o json '.key')
result=$(echo "$result" | tr -d '"')
[ "$result" = "value" ]

echo "All yq assertions passed"
