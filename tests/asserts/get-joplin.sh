#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-joplin.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# Joplin has no distro package: the install is an AppImage placed by upstream's
# installer, which is per-user by default. Run as root this script installs to
# /opt/joplin with a shared launcher instead, so these assertions check the
# machine-wide layout rather than just "something is on PATH".
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# Install prereqs that the script expects to exist
echo "Installing prereqs: curl, ca-certificates, bash..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq && apt-get install -y -qq curl ca-certificates bash >/dev/null 2>&1
elif command -v dnf >/dev/null 2>&1; then
    dnf install -y -q curl ca-certificates bash >/dev/null 2>&1
elif command -v yum >/dev/null 2>&1; then
    yum install -y -q curl ca-certificates bash >/dev/null 2>&1
fi

echo "Assert: joplin-desktop exists and is executable"
command -v joplin-desktop
[ -x "$(command -v joplin-desktop)" ]

echo "Assert: installed system-wide, not into a home directory"
[ -x /opt/joplin/Joplin.AppImage ]

echo "Assert: the AppImage is not a stray download at /"
[ ! -e /Joplin.AppImage ]

echo "Assert: a version was recorded"
[ -s /opt/joplin/VERSION ]

echo "Assert: the AppImage is readable by every user, not just root"
[ "$(stat -c '%A' /opt/joplin/Joplin.AppImage | cut -c8)" = "r" ]

echo "Assert: a desktop entry exists for all users"
[ -f /usr/share/applications/joplin.desktop ]
grep -q '^Exec=' /usr/share/applications/joplin.desktop

echo "All joplin assertions passed"
