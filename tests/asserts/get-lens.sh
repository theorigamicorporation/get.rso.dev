#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-lens.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# There is no lens package in Ubuntu, Debian or Mint (the script used to run
# `apt-get install lens` and die with "E: Unable to locate package"), so the
# install only works if the Lens apt repository was really added and read. The
# deb also ships nothing on PATH -- its only executable is /opt/Lens/lens-desktop
# -- so a successful install still leaves `lens` unrunnable unless the script
# links it. These assertions check both, plus an apt broken by a duplicate source
# for the same host (E: Conflicting values set for option Signed-By), which takes
# unattended security updates down with it.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Installing prereqs: curl, ca-certificates, gpg..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y -qq curl ca-certificates gpg >/dev/null 2>&1
fi

if [ "${TEST_METHOD:-apt}" = "apt" ] || [ -z "${TEST_METHOD}" ]; then
    echo "Assert: dpkg registered lens as fully installed"
    dpkg -s lens >/dev/null 2>&1
    [ "$(dpkg-query -W -f='${Status}' lens)" = "install ok installed" ]

    echo "Assert: the app binary belongs to the package and is a program"
    dpkg -S /opt/Lens/lens-desktop 2>/dev/null | grep -q '^lens:'
    [ -x /opt/Lens/lens-desktop ]
    head -c 4 /opt/Lens/lens-desktop | grep -q 'ELF' || {
        echo "FAIL: /opt/Lens/lens-desktop is not an ELF binary"; exit 1; }

    echo "Assert: lens is on PATH and resolves to that binary"
    command -v lens
    _target=$(command -v lens)
    [ "$(readlink -f "$_target")" = "/opt/Lens/lens-desktop" ] || {
        echo "FAIL: $_target does not resolve to /opt/Lens/lens-desktop"; exit 1; }

    echo "Assert: the desktop entry was installed"
    [ -f /usr/share/applications/lens-desktop.desktop ]

    echo "Assert: the apt source was added with signed-by and a real keyring"
    grep -q 'downloads.k8slens.dev' /etc/apt/sources.list.d/lens.list
    grep -q 'signed-by=/usr/share/keyrings/lens-archive-keyring.gpg' /etc/apt/sources.list.d/lens.list
    [ -s /usr/share/keyrings/lens-archive-keyring.gpg ]

    echo "Assert: only one source file references downloads.k8slens.dev"
    _dupes=$(grep -rl 'downloads\.k8slens\.dev' /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources 2>/dev/null | wc -l)
    [ "$_dupes" -eq 1 ] || { echo "FAIL: $_dupes source files reference downloads.k8slens.dev"; exit 1; }

    echo "Assert: apt can still read every source (no Signed-By conflict)"
    apt-get update -qq

    echo "Assert: apt sees the package as coming from the Lens repo"
    apt-cache policy lens | grep -q 'downloads.k8slens.dev'
fi

echo "All lens assertions passed"
