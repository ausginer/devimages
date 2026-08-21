#!/bin/sh
set -eu

remote_user="${USERNAME:-${_REMOTE_USER:-${_CONTAINER_USER:-node}}}"
remote_user_home="${_REMOTE_USER_HOME:-${_CONTAINER_USER_HOME:-}}"

if ! id "$remote_user" >/dev/null 2>&1; then
  echo "User '${remote_user}' does not exist." >&2
  exit 1
fi

if [ -z "$remote_user_home" ] || [ "$(id -un "$remote_user")" != "${_REMOTE_USER:-}" ]; then
  remote_user_home="$(getent passwd "$remote_user" | cut -d: -f6)"
fi

if su "$remote_user" -c "command -v claude" >/dev/null 2>&1; then
  exit 0
fi

su "$remote_user" -c "curl -fsSL https://claude.ai/install.sh | bash"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${remote_user_home}/.bashrc"
rm -rf "${remote_user_home}/.claude"
su "$remote_user" -c "claude --version" -l
