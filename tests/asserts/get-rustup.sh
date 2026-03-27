#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-rustup.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# Install prereqs that the script expects to exist (only if running as root)
# For @noroot scripts, the test runner installs prereqs as root before switching users
if [ "$(id -u)" -eq 0 ]; then
    echo "Installing prereqs: curl, ca-certificates..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update -qq && apt-get install -y -qq curl ca-certificates >/dev/null 2>&1
    elif command -v dnf >/dev/null 2>&1; then
        dnf install -y -q curl ca-certificates >/dev/null 2>&1
    elif command -v yum >/dev/null 2>&1; then
        yum install -y -q curl ca-certificates >/dev/null 2>&1
    fi
fi

# Source cargo env (may not be in PATH yet in the container)
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

echo "Assert: rustup binary exists"
command -v rustup

echo "Assert: rustup --version outputs version"
rustup --version | grep -qi 'rustup'

echo "Assert: cargo binary exists"
command -v cargo

echo "Assert: cargo --version outputs version"
cargo --version | grep -qi 'cargo'

echo "Assert: rustc binary exists"
command -v rustc

echo "Assert: rustc --version outputs version"
rustc --version | grep -qi 'rustc'

echo "Assert: cargo env file exists"
[ -f "$HOME/.cargo/env" ]

echo "Assert: cargo env sourced in at least one shell profile"
_found=false
for _rc in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
    if [ -f "$_rc" ] && grep -qF '.cargo/env' "$_rc" 2>/dev/null; then
        echo "  Found in $_rc"
        _found=true
    fi
done
[ "$_found" = true ]

echo "All rustup assertions passed"
