#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-gitlab-cli.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Assert: glab binary exists"
command -v glab

echo "Assert: glab --version really runs and identifies itself as glab"
# A file on PATH proves nothing (see get-rustdesk): run it and read the output.
glab --version | head -1 | grep -qi 'glab'

echo "Assert: reported version is not the stale 2022 GitHub mirror (<= 1.22.0)"
_ver=$(glab --version | head -1 | sed 's/[^0-9]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/')
_major=$(printf '%s' "$_ver" | cut -d. -f1)
_minor=$(printf '%s' "$_ver" | cut -d. -f2)
[ -n "$_major" ] && [ -n "$_minor" ]
[ "$_major" -gt 1 ] || [ "$_minor" -gt 22 ]

echo "Assert: glab subcommands are usable (help lists mr)"
glab --help 2>&1 | grep -q 'mr'

echo "All glab assertions passed"
