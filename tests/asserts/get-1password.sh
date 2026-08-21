#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-1password.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# There is no 1password package in Ubuntu, Debian or Mint (the script used to run
# `apt-get install 1password` and die with "E: Unable to locate package"), so the
# install only works if the 1Password apt repository was really added and read.
# These assertions check what silently goes wrong: a package that was never
# registered, a /usr/bin/1password that is not the app, and an apt broken by a
# duplicate source for the same host (E: Conflicting values set for option
# Signed-By), which takes unattended security updates down with it.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Installing prereqs: curl, ca-certificates, gpg..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y -qq curl ca-certificates gpg >/dev/null 2>&1
fi

if [ "${TEST_METHOD:-apt}" = "apt" ] || [ -z "${TEST_METHOD}" ]; then
    echo "Assert: dpkg registered 1password as fully installed"
    dpkg -s 1password >/dev/null 2>&1
    [ "$(dpkg-query -W -f='${Status}' 1password)" = "install ok installed" ]

    echo "Assert: 1password is on PATH"
    command -v 1password

    echo "Assert: the app binary belongs to the package and is a program"
    dpkg -S /opt/1Password/1password 2>/dev/null | grep -q '^1password:'
    [ -x /opt/1Password/1password ]
    head -c 4 /opt/1Password/1password | grep -q 'ELF' || {
        echo "FAIL: /opt/1Password/1password is not an ELF binary"; exit 1; }

    echo "Assert: the command on PATH resolves to that binary"
    _target=$(command -v 1password)
    [ "$(readlink -f "$_target")" = "/opt/1Password/1password" ] || {
        echo "FAIL: $_target does not resolve to /opt/1Password/1password"; exit 1; }

    echo "Assert: the repository keyring is a real key"
    [ -s /usr/share/keyrings/1password-archive-keyring.gpg ]

    echo "Assert: the repository is configured and signed-by a keyring that exists"
    _srcfiles=$(grep -rl 'downloads\.1password\.com' /etc/apt/sources.list /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources 2>/dev/null || true)
    [ -n "$_srcfiles" ] || { echo "FAIL: no apt source references downloads.1password.com"; exit 1; }
    grep -rhqE 'Signed-By:|signed-by=' $_srcfiles || {
        echo "FAIL: the 1Password source has no Signed-By"; exit 1; }

    # The postinst installs the package's own /etc/apt/sources.list.d/1password.sources and
    # comments ours out. Two files for one host is how the Signed-By conflict gets built:
    # the script must leave exactly one behind, the package's own.
    echo "Assert: exactly one source file references downloads.1password.com"
    _dupes=$(printf '%s\n' "$_srcfiles" | wc -l)
    [ "$_dupes" -eq 1 ] || { echo "FAIL: $_dupes source files reference downloads.1password.com: $_srcfiles"; exit 1; }

    echo "Assert: the leftover bootstrap source was removed once the package shipped its own"
    if [ -f /etc/apt/sources.list.d/1password.sources ]; then
        [ ! -f /etc/apt/sources.list.d/1password.list ] || {
            echo "FAIL: both 1password.sources and 1password.list exist"; exit 1; }
    fi

    echo "Assert: apt can still read every source (no Signed-By conflict)"
    apt-get update -qq

    echo "Assert: apt sees the package as coming from the 1Password repo"
    apt-cache policy 1password | grep -q 'downloads.1password.com'
fi

echo "All 1password assertions passed"
