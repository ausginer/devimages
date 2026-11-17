#!/bin/sh
set -eu

version="${VERSION:-1.65.0}"

if ! command -v npx >/dev/null 2>&1; then
  echo "npx must be installed before the playwright-webkit-deps feature runs." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

# install-deps runs apt-get update and installs the package set that this
# Playwright version's WebKit needs on the image's Debian release. It does not
# download the browser build, which follows the consumer's lockfile.
npx -y "playwright@${version}" install-deps webkit

apt-get clean
rm -rf /var/lib/apt/lists/*
npm cache clean --force
