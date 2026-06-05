#!/bin/sh
set -eu

remote_user="${_REMOTE_USER:-}"
remote_user_home="${_REMOTE_USER_HOME:-}"

if [ -z "$remote_user" ] || [ -z "$remote_user_home" ]; then
  echo "_REMOTE_USER and _REMOTE_USER_HOME are required." >&2
  exit 1
fi

if su "$remote_user" -c "command -v claude" >/dev/null 2>&1; then
  exit 0
fi

su "$remote_user" -c "curl -fsSL https://claude.ai/install.sh | bash"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${remote_user_home}/.bashrc"
rm -rf "${remote_user_home}/.claude"
su "$remote_user" -c "claude --version" -l
