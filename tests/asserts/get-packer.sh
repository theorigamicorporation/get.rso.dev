#!/usr/bin/env sh
set -e

# RHEL, Rocky and AlmaLinux ship /usr/sbin/packer (a symlink to cracklib-packer
# from cracklib-dicts). "command -v packer" finds it, so an install that did
# nothing at all still looked successful. Assert the packer on PATH is really
# HashiCorp Packer.

echo "Assert: packer exists"
command -v packer

echo "Assert: packer on PATH is HashiCorp Packer, not cracklib-packer"
out=$(packer version </dev/null 2>&1 | head -1)
echo "  packer version -> ${out}"
echo "$out" | grep -qi '^packer v'

echo "Assert: packer is not the cracklib symlink"
resolved=$(command -v packer)
case "$resolved" in
    */cracklib-packer) echo "packer resolves to cracklib-packer"; exit 1 ;;
esac

echo "All packer assertions passed"
