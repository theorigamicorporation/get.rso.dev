#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-jq.sh
# Runs inside the test container AFTER the installer has completed.
# Arguments: $1=script_name  $2=image  $3=method (or "default")
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

SCRIPT_NAME="${1:-get-jq.sh}"
IMAGE="${2:-unknown}"
METHOD="${3:-default}"

echo "Running assertions for ${SCRIPT_NAME} on ${IMAGE} (method: ${METHOD})"

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
