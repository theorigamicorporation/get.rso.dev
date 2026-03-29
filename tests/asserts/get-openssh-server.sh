#!/usr/bin/env sh
# =============================================================================
# Assertions for get-openssh-server.sh
#
# Environment variables set by test runner:
#   TEST_SCRIPT, TEST_IMAGE, TEST_METHOD, TEST_PREREQS
# =============================================================================
set -e

echo "Running assertions for ${TEST_SCRIPT} on ${TEST_IMAGE} (method: ${TEST_METHOD:-default})"

echo "Assert: sshd binary exists"
[ -x /usr/sbin/sshd ] || command -v sshd >/dev/null 2>&1

echo "Assert: sshd config is valid"
/usr/sbin/sshd -t 2>/dev/null || sshd -t 2>/dev/null

echo "Assert: ssh-keygen is available"
command -v ssh-keygen

echo "Assert: host keys were generated"
_found=false
for _key in /etc/ssh/ssh_host_*_key; do
    [ -f "$_key" ] && _found=true && break
done
[ "$_found" = true ]
echo "  Host keys present"

echo "All openssh-server assertions passed"
