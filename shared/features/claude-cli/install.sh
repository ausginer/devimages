#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive

if command -v claude >/dev/null 2>&1; then
  exit 0
fi

install -d -m 0755 /etc/apt/keyrings
curl -fsSL https://downloads.claude.ai/keys/claude-code.asc \
  -o /etc/apt/keyrings/claude-code.asc

actual=$(gpg --show-keys --with-colons /etc/apt/keyrings/claude-code.asc 2>/dev/null \
  | awk -F: '/^fpr/ { print $10; exit }')
expected="31DDDE24DDFAB679F42D7BD2BAA929FF1A7ECACE"
if [ "$actual" != "$expected" ]; then
  echo "GPG key fingerprint mismatch: expected $expected, got $actual" >&2
  exit 1
fi

echo "deb [signed-by=/etc/apt/keyrings/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
  > /etc/apt/sources.list.d/claude-code.list

apt-get update
apt-get install -y --no-install-recommends claude-code
apt-get clean
rm -rf /var/lib/apt/lists/*

claude --version
