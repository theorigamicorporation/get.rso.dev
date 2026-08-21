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

# Install prereqs the script expects, but only the ones that are actually missing:
# on Rocky 9 the image ships curl-minimal, and asking dnf for "curl" fails outright
# with a conflict, which under `set -e` aborted these assertions before they ran.
install_pkg() {
    if command -v apt-get >/dev/null 2>&1; then
        apt-get install -y -qq "$@" >/dev/null 2>&1 || true
    elif command -v dnf >/dev/null 2>&1; then
        dnf install -y -q "$@" >/dev/null 2>&1 || true
    elif command -v yum >/dev/null 2>&1; then
        yum install -y -q "$@" >/dev/null 2>&1 || true
    fi
}

echo "Installing missing prereqs..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq >/dev/null 2>&1 || true
fi
if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    install_pkg curl
fi
install_pkg ca-certificates
command -v bash >/dev/null 2>&1 || install_pkg bash

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

# Upstream's installer aborts with "Can't get libfuse2 on system" when libfuse.so.2
# is absent, which is what happened on Rocky (fuse-libs is not installed by default).
# Without FUSE the AppImage cannot start even if the files are in place.
echo "Assert: libfuse.so.2 is present so the AppImage can run"
{ command -v ldconfig >/dev/null 2>&1 && ldconfig -p | grep -q 'libfuse\.so\.2'; } \
    || find /lib /usr/lib /lib64 /usr/lib64 -name 'libfuse.so.2' 2>/dev/null | grep -q .

echo "All joplin assertions passed"
