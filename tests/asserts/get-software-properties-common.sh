#!/usr/bin/env sh
set -e

echo "Assert: add-apt-repository is on PATH"
command -v add-apt-repository

echo "Assert: the package is registered with dpkg"
dpkg -s software-properties-common >/dev/null

echo "Assert: add-apt-repository runs"
add-apt-repository --help >/dev/null

echo "All software-properties-common assertions passed"
