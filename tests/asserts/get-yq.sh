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

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD})"

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
