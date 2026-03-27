#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-yq.sh
# Runs inside the test container AFTER the installer has completed.
# Arguments: $1=script_name  $2=image  $3=method (or "default")
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

SCRIPT_NAME="${1:-get-yq.sh}"
IMAGE="${2:-unknown}"
METHOD="${3:-default}"

echo "Running assertions for ${SCRIPT_NAME} on ${IMAGE} (method: ${METHOD})"

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
