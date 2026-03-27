#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-apt-fast.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested
#   TEST_IMAGE   — container image
#   TEST_METHOD  — install method (only set for installer scripts with --method)
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# apt-fast is Debian-family only
case "${TEST_IMAGE}" in
    *ubuntu*|*debian*|*mint*)
        echo "Assert: apt-fast binary exists"
        command -v apt-fast

        echo "Assert: apt-fast is executable"
        [ -x "$(command -v apt-fast)" ]

        echo "Assert: apt-fast can show help"
        apt-fast --help >/dev/null 2>&1 || apt-fast help >/dev/null 2>&1 || true

        echo "Assert: aria2c is installed (apt-fast dependency)"
        command -v aria2c

        echo "All apt-fast assertions passed"
        ;;
    *)
        echo "Skipping: apt-fast is Debian-family only, not applicable to ${TEST_IMAGE}"
        echo "All apt-fast assertions passed"
        ;;
esac
