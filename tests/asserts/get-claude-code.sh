#!/usr/bin/env sh
# =============================================================================
# Assertions for get-claude-code.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Assert: claude binary exists"
command -v claude

echo "Assert: claude --version returns output"
_version=$(claude --version 2>/dev/null)
[ -n "$_version" ]
echo "  Version: $_version"

echo "Assert: claude --help works"
claude --help >/dev/null 2>&1

echo "All claude-code assertions passed"
