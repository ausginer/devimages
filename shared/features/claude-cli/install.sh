#!/bin/sh
set -eu

if su node -c "command -v claude" >/dev/null 2>&1; then
  exit 0
fi

su node -c "curl -fsSL https://claude.ai/install.sh | bash"
su node -c "claude --version"
