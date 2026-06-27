#!/bin/sh
set -eu

if command -v helix >/dev/null 2>&1; then
  exit 0
fi

curl -fsSL https://install.helix-db.com | bash -s -- --system

helix --version
