#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-jq.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
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

echo "Assert: jq binary exists"
command -v jq

echo "Assert: jq --version outputs version string"
jq --version | grep -q 'jq-'

echo "Assert: jq can parse JSON"
result=$(echo '{"name":"test"}' | jq -r '.name')
[ "$result" = "test" ]

echo "Assert: jq can filter arrays"
result=$(echo '[1,2,3]' | jq '.[1]')
[ "$result" = "2" ]

echo "Assert: jq can handle null input"
result=$(echo 'null' | jq '.')
[ "$result" = "null" ]

echo "All jq assertions passed"
