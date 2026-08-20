#!/usr/bin/env sh
# =============================================================================
# Custom assertions for get-jitsi.sh
# Runs inside the test container AFTER the installer has completed.
#
# Environment variables set by test runner:
#   TEST_SCRIPT  — script being tested (e.g. get-jitsi.sh)
#   TEST_IMAGE   — container image
#   TEST_METHOD  — install method used
#
# Exit 0 = all assertions pass, non-zero = failure.
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

# A .deb with unsatisfied dependencies unpacks but never configures, which
# leaves a broken package that still puts /usr/bin/jitsi on PATH. Checking the
# binary alone would report success in exactly that case.
if ! dpkg -s jitsi 2>/dev/null | grep -q '^Status: install ok installed'; then
    echo "FAIL: jitsi is not registered as installed with dpkg"
    dpkg -s jitsi 2>/dev/null | grep '^Status' || echo "  (package not known to dpkg)"
    exit 1
fi
echo "  ok: dpkg reports jitsi installed"

# The launcher must exist and be executable, not merely present.
[ -x /usr/bin/jitsi ] || { echo "FAIL: /usr/bin/jitsi missing or not executable"; exit 1; }
echo "  ok: /usr/bin/jitsi is executable"

# Jitsi is a Java application; without a JRE it installs and then fails to start.
command -v java >/dev/null 2>&1 || { echo "FAIL: no java runtime present"; exit 1; }
echo "  ok: java runtime present ($(java -version 2>&1 | head -1))"

# The point of this installer is the provisioning server, so assert it landed
# machine-wide rather than in some user's home.
DEFAULTS=/usr/share/jitsi/lib/jitsi-defaults.properties
[ -f "$DEFAULTS" ] || { echo "FAIL: $DEFAULTS missing"; exit 1; }

grep -q '^net\.java\.sip\.communicator\.plugin\.provisioning\.METHOD=Manual$' "$DEFAULTS" || {
    echo "FAIL: provisioning METHOD not set to Manual"; exit 1; }

URL_LINE=$(grep '^net\.java\.sip\.communicator\.plugin\.provisioning\.URL=' "$DEFAULTS" || true)
[ -n "$URL_LINE" ] || { echo "FAIL: provisioning URL not set"; exit 1; }
echo "  ok: ${URL_LINE}"

# Re-running must not accumulate duplicate keys, since Jitsi reads the last
# value and a stale earlier line would be silently ignored or win.
COUNT=$(grep -c '^net\.java\.sip\.communicator\.plugin\.provisioning\.URL=' "$DEFAULTS")
[ "$COUNT" = "1" ] || { echo "FAIL: expected 1 provisioning URL line, found $COUNT"; exit 1; }
echo "  ok: exactly one provisioning URL line"

echo "All assertions passed."
