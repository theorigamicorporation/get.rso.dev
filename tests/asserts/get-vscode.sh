#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-vscode.sh
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
    echo "Assert: VS Code is installed via flatpak"
    flatpak info com.visualstudio.code >/dev/null 2>&1

    echo "All vscode assertions passed"
    exit 0
fi

echo "Assert: code binary exists"
command -v code

echo "Assert: code --version outputs version info"
code --version | head -1 | grep -qE '[0-9]+\.[0-9]+'

echo "Assert: VS Code repo is configured (apt)"
if [ -f /etc/apt/sources.list.d/vscode.list ]; then
    echo "  Found apt repo"
    grep -q 'packages.microsoft.com' /etc/apt/sources.list.d/vscode.list
fi

echo "Assert: VS Code repo is configured (dnf)"
if [ -f /etc/yum.repos.d/vscode.repo ]; then
    echo "  Found dnf repo"
    grep -q 'packages.microsoft.com' /etc/yum.repos.d/vscode.repo
fi

echo "All vscode assertions passed"
