#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-jq.sh
# Runs inside the test container AFTER the installer has completed.
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested (e.g. get-jq.sh)
#   TEST_IMAGE   — container image (e.g. docker.io/library/ubuntu:24.04)
#   TEST_METHOD  — install method used (e.g. apt, github-release, or "default")
#
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD})"

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
