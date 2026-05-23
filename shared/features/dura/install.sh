#!/bin/sh
set -eu

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo must be installed before the dura feature runs." >&2
  exit 1
fi

if command -v dura >/dev/null 2>&1; then
  exit 0
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  pkg-config \
  libssl-dev

cargo install --locked --root /usr/local dura

apt-get clean
rm -rf /var/lib/apt/lists/*

dura --version
