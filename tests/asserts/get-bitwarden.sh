#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-bitwarden.sh
#
# There is no "bitwarden" package in any Debian-family repository; the script
# used to apt-install one and always failed. It now fetches Bitwarden's official
# .deb, so these assertions check a real package was registered, not merely that
# something answers to the name.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Installing prereqs: curl, ca-certificates..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq && apt-get install -y -qq curl ca-certificates >/dev/null 2>&1
fi

echo "Assert: bitwarden is on PATH and executable"
command -v bitwarden
[ -x "$(command -v bitwarden)" ]

echo "Assert: dpkg registered the package"
dpkg -s bitwarden >/dev/null 2>&1

echo "Assert: a version was recorded"
[ -n "$(dpkg-query -W -f='${Version}' bitwarden 2>/dev/null)" ]

echo "All bitwarden assertions passed"
