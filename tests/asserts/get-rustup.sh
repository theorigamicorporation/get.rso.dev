#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-rustup.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested
#   TEST_IMAGE   — container image
#   TEST_METHOD  — install method (only set for installer scripts with --method)
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

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
