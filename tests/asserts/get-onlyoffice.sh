#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-onlyoffice.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# There is no onlyoffice-desktopeditors package in Ubuntu, Debian or Mint, so the
# install only works if the ONLYOFFICE apt repository was really added and read.
# These assertions check the two things that silently go wrong: a package that was
# never registered, and an apt that was broken by a duplicate source for the same
# host (E: Conflicting values set for option Signed-By), which takes security
# updates down with it.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Installing prereqs: curl, ca-certificates, gpg..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y -qq curl ca-certificates gpg >/dev/null 2>&1
fi

if [ "${TEST_METHOD:-apt}" = "apt" ] || [ -z "${TEST_METHOD}" ]; then
    echo "Assert: dpkg registered onlyoffice-desktopeditors as fully installed"
    dpkg -s onlyoffice-desktopeditors >/dev/null 2>&1
    [ "$(dpkg-query -W -f='${Status}' onlyoffice-desktopeditors)" = "install ok installed" ]

    echo "Assert: onlyoffice-desktopeditors is on PATH"
    command -v onlyoffice-desktopeditors

    echo "Assert: the file on PATH belongs to the package, and is a program"
    _target=$(command -v onlyoffice-desktopeditors)
    dpkg -S "$_target" 2>/dev/null | grep -q onlyoffice-desktopeditors
    head -c 4 "$_target" | grep -q 'ELF' || head -c 2 "$_target" | grep -q '#!' || {
        echo "FAIL: $_target is neither an ELF binary nor a script"; exit 1; }

    echo "Assert: the real editor binary was unpacked"
    [ -x /opt/onlyoffice/desktopeditors/DesktopEditors ]

    echo "Assert: the apt source was added with signed-by and a real keyring"
    grep -q 'download.onlyoffice.com' /etc/apt/sources.list.d/onlyoffice.list
    grep -q 'signed-by=/usr/share/keyrings/onlyoffice-archive-keyring.gpg' /etc/apt/sources.list.d/onlyoffice.list
    [ -s /usr/share/keyrings/onlyoffice-archive-keyring.gpg ]

    echo "Assert: only one source file references download.onlyoffice.com"
    _dupes=$(grep -rl 'download\.onlyoffice\.com' /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources 2>/dev/null | wc -l)
    [ "$_dupes" -eq 1 ] || { echo "FAIL: $_dupes source files reference download.onlyoffice.com"; exit 1; }

    echo "Assert: apt can still read every source (no Signed-By conflict)"
    apt-get update -qq

    echo "Assert: apt sees the package as installed and upgradable from the repo"
    apt-cache policy onlyoffice-desktopeditors | grep -q 'download.onlyoffice.com'
fi

echo "All onlyoffice assertions passed"
