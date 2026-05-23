#!/bin/sh
set -eu

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo must be installed before the dura feature runs." >&2
  exit 1
fi

if command -v dura >/dev/null 2>&1; then
  exit 0
fi

cargo install --locked --root /usr/local dura

dura --version
