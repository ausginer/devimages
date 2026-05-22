#!/bin/sh
set -eu

if ! command -v npm >/dev/null 2>&1; then
  echo "npm must be installed before the codex-cli feature runs." >&2
  exit 1
fi

if command -v codex >/dev/null 2>&1; then
  exit 0
fi

npm install -g @openai/codex

codex --version
