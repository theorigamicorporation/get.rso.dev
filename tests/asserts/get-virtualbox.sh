#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-virtualbox.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# Debian has shipped no `virtualbox` package since bookworm, so the apt path adds
# Oracle's repository and installs a version-numbered package (virtualbox-7.2).
# These assertions check a package manager really registered an install and that
# adding the repo did not leave apt with conflicting sources.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Assert: VBoxManage is on PATH"
_vbox=$(command -v VBoxManage || command -v vboxmanage)
[ -n "$_vbox" ]

echo "Assert: VBoxManage reports a version"
"$_vbox" --version 2>/dev/null | tail -1 | grep -qE '^[0-9]+\.[0-9]+'

echo "Assert: a package manager registered the install"
if command -v dpkg >/dev/null 2>&1; then
    dpkg -l 2>/dev/null | grep -qE '^ii +(virtualbox|virtualbox-[0-9]+\.[0-9]+) '
elif command -v rpm >/dev/null 2>&1; then
    rpm -qa 2>/dev/null | grep -qiE '^(VirtualBox|virtualbox)'
fi

echo "Assert: apt can still read every source (no Signed-By conflict)"
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq >/tmp/aptout.txt 2>&1 || true
    if grep -qi 'Conflicting values set for option Signed-By' /tmp/aptout.txt; then
        echo "FAIL: adding the VirtualBox repo broke apt sources"; exit 1
    fi
fi

echo "All virtualbox assertions passed"
