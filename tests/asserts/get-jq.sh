#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-jq.sh
# Runs inside the test container AFTER the installer has completed.
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

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

echo "All jq assertions passed"
