#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-rustdesk.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
#
# RustDesk ships a .deb/.rpm, not a bare binary. An earlier version of the
# installer moved the downloaded package straight to /usr/local/bin/rustdesk and
# chmod +x'd it: `command -v rustdesk` passed, the script exited 0, and nothing
# worked. These assertions exist to catch exactly that.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# Install prereqs the script expects, but only the ones that are actually missing:
# on Rocky 9 the image ships curl-minimal, and asking dnf for "curl" fails outright
# with a conflict, which under `set -e` aborted these assertions before they ran.
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

echo "Assert: rustdesk exists on PATH"
command -v rustdesk

echo "Assert: rustdesk is executable"
[ -x "$(command -v rustdesk)" ]

echo "Assert: rustdesk is a program, not a downloaded package"
_target=$(command -v rustdesk)
case "$(head -c 8 "$_target" | od -c | head -1)" in
    *'!'*'<'*a*r*c*h*) echo "FAIL: $_target is an ar archive (.deb), not a program"; exit 1 ;;
esac
head -c 4 "$_target" | grep -q 'ELF' || {
    # A wrapper shell script is fine; an archive is not.
    head -c 2 "$_target" | grep -q '#!' || {
        echo "FAIL: $_target is neither an ELF binary nor a script"; exit 1; }
}

echo "Assert: the package manager registered the install"
if command -v dpkg >/dev/null 2>&1; then
    dpkg -s rustdesk >/dev/null 2>&1
elif command -v rpm >/dev/null 2>&1; then
    rpm -q rustdesk >/dev/null 2>&1
fi

echo "All rustdesk assertions passed"
