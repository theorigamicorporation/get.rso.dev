#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-amneziawg.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# The tools zip upstream ships is built on Ubuntu 22.04 and only runs on
# glibc >= 2.34; elsewhere the script must fall back to a source build. And
# awg-quick only creates an interface when amneziawg-go (or the kernel module)
# is present, so all three binaries must actually run, not just exist.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

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

echo "Assert: awg runs and reports amneziawg-tools"
/usr/local/bin/awg --version | grep -q 'amneziawg-tools'

echo "Assert: awg-quick is the bash script and its interpreter exists"
head -1 /usr/local/bin/awg-quick | grep -q bash
command -v bash >/dev/null
command -v ip >/dev/null

echo "Assert: amneziawg-go runs and reports a tagged version, not an empty stamp"
/usr/local/bin/amneziawg-go --version | head -1 | grep -q '[0-9]\.[0-9]'

echo "Assert: config dir exists and is private"
[ "$(stat -c %a /etc/amnezia/amneziawg)" = "700" ]

echo "Assert: systemd unit points at the installed awg-quick"
if [ -d /etc/systemd/system ]; then
    grep -q '^ExecStart=/usr/local/bin/awg-quick up %i$' '/etc/systemd/system/awg-quick@.service'
fi

echo "All amneziawg assertions passed"
