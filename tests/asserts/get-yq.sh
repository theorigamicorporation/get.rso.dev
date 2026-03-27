#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-yq.sh
# Runs inside the test container AFTER the installer has completed.
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

echo "Assert: yq binary exists"
command -v yq

echo "Assert: yq --version outputs version string"
yq --version | grep -qi 'version'

echo "Assert: yq can parse YAML"
result=$(printf 'name: test\n' | yq '.name')
[ "$result" = "test" ]

echo "Assert: yq can parse JSON"
result=$(echo '{"key":"value"}' | yq -o json '.key')
# yq outputs JSON strings with quotes
result=$(echo "$result" | tr -d '"')
[ "$result" = "value" ]

echo "All yq assertions passed"
