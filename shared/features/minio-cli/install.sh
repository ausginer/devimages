#!/bin/sh
set -eu

if command -v mc >/dev/null 2>&1; then
  exit 0
fi

tmp="$(mktemp)"

curl -fsSL https://dl.min.io/client/mc/release/linux-amd64/mc -o "$tmp"
install -m 0755 "$tmp" /usr/local/bin/mc
rm -f "$tmp"

mc --version
