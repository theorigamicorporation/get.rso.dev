#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-apt-fast.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# apt-fast is Debian-family only
case "${TEST_IMAGE}" in
    *ubuntu*|*debian*|*mint*)
        # Install prereqs that the script expects to exist
        echo "Installing prereqs: software-properties-common..."
        apt-get update -qq >/dev/null 2>&1
        apt-get install -y -qq software-properties-common >/dev/null 2>&1

        echo "Assert: apt-fast binary exists"
        command -v apt-fast

        echo "Assert: apt-fast is executable"
        [ -x "$(command -v apt-fast)" ]

        echo "Assert: aria2c is installed (apt-fast dependency)"
        command -v aria2c

        echo "All apt-fast assertions passed"
        ;;
    *)
        echo "Skipping: apt-fast is Debian-family only, not applicable to ${TEST_IMAGE}"
        echo "All apt-fast assertions passed"
        ;;
esac
