#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-google-chrome.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# Install prereqs that the script expects to exist
echo "Installing prereqs: curl, gpg, ca-certificates..."
if command -v apt-get >/dev/null 2>&1; then
    apt-get update -qq && apt-get install -y -qq curl gpg ca-certificates >/dev/null 2>&1
elif command -v dnf >/dev/null 2>&1; then
    dnf install -y -q curl gnupg2 ca-certificates >/dev/null 2>&1
elif command -v yum >/dev/null 2>&1; then
    yum install -y -q curl gnupg2 ca-certificates >/dev/null 2>&1
fi

# Flatpak installs don't put the binary in PATH
if [ "${TEST_METHOD}" = "flatpak" ]; then
    echo "Assert: Chrome is installed via flatpak"
    flatpak info com.google.Chrome >/dev/null 2>&1

    echo "All google-chrome assertions passed"
    exit 0
fi

echo "Assert: google-chrome-stable binary exists"
command -v google-chrome-stable

echo "Assert: google-chrome-stable --version outputs version"
google-chrome-stable --version | grep -qi 'google chrome'

echo "Assert: Chrome repo is configured (apt)"
if [ -f /etc/apt/sources.list.d/google-chrome.list ]; then
    echo "  Found apt repo"
    grep -q 'dl.google.com' /etc/apt/sources.list.d/google-chrome.list
fi

echo "Assert: Chrome repo is configured (dnf)"
if [ -f /etc/yum.repos.d/google-chrome.repo ]; then
    echo "  Found dnf repo"
    grep -q 'dl.google.com' /etc/yum.repos.d/google-chrome.repo
fi

echo "All google-chrome assertions passed"
