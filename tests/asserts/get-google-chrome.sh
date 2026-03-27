#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-google-chrome.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested
#   TEST_IMAGE   — container image
#   TEST_METHOD  — install method (only set for installer scripts with --method)
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

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
    echo "  Found apt repo: /etc/apt/sources.list.d/google-chrome.list"
    grep -q 'dl.google.com' /etc/apt/sources.list.d/google-chrome.list
fi

echo "Assert: Chrome repo is configured (dnf)"
if [ -f /etc/yum.repos.d/google-chrome.repo ]; then
    echo "  Found dnf repo: /etc/yum.repos.d/google-chrome.repo"
    grep -q 'dl.google.com' /etc/yum.repos.d/google-chrome.repo
fi

echo "All google-chrome assertions passed"
