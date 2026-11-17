#!/bin/sh
set -eu

version="${VERSION:-2.10.0}"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm must be installed before the aube feature runs." >&2
  exit 1
fi

if command -v aube >/dev/null 2>&1 && aube --version | grep -q "^${version} "; then
  exit 0
fi

# The package downloads its platform binary in a preinstall script, so scripts
# must be allowed for this install.
npm install -g --ignore-scripts=false "@endevco/aube@${version}"
npm cache clean --force

aube --version
