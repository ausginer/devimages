#!/bin/sh
set -eu

if ! command -v curl >/dev/null 2>&1; then
  echo "curl must be installed before the claude-cli feature runs." >&2
  exit 1
fi

if command -v claude >/dev/null 2>&1; then
  exit 0
fi

curl -fsSL https://claude.ai/install.sh | sh
