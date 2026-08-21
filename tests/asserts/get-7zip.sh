#!/usr/bin/env sh
set -e

# The 7zip package does not ship /usr/bin/7z on every release (Debian 12 and
# Ubuntu 22.04 ship only 7zz), so assert the command exists, runs, and can
# actually round-trip an archive -- not merely that a file sits on PATH.

echo "Assert: 7z is on PATH"
command -v 7z

echo "Assert: 7z runs"
7z i >/dev/null

echo "Assert: 7z round-trips an archive"
_dir=$(mktemp -d)
echo "get.rso.dev" > "$_dir/sample.txt"
7z a "$_dir/sample.7z" "$_dir/sample.txt" >/dev/null
rm -f "$_dir/sample.txt"
7z x -o"$_dir" "$_dir/sample.7z" >/dev/null
grep -q "get.rso.dev" "$_dir/sample.txt"
rm -rf "$_dir"

echo "All 7zip assertions passed"
