#!/bin/sh
set -eu

remote_user="${USERNAME:-${_REMOTE_USER:-${_CONTAINER_USER:-node}}}"

if ! id "$remote_user" >/dev/null 2>&1; then
  echo "User '${remote_user}' does not exist." >&2
  exit 1
fi

remote_user_home="$(getent passwd "$remote_user" | cut -d: -f6)"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl must be installed before the opencode-cli feature runs." >&2
  exit 1
fi

if ! command -v bash >/dev/null 2>&1; then
  echo "bash must be installed before the opencode-cli feature runs." >&2
  exit 1
fi

installer="$(mktemp)"
trap 'rm -f "$installer"' EXIT HUP INT TERM

curl -fsSL https://opencode.ai/install -o "$installer"
chmod 0755 "$installer"

su "$remote_user" -c \
  "HOME='$remote_user_home' bash '$installer' --no-modify-path"

opencode_bin="${remote_user_home}/.opencode/bin/opencode"

if [ ! -x "$opencode_bin" ]; then
  echo "OpenCode installation did not produce '${opencode_bin}'." >&2
  exit 1
fi

cat > /usr/local/bin/opencode <<EOF
#!/bin/sh
exec "$opencode_bin" "\$@"
EOF

chmod 0755 /usr/local/bin/opencode

su "$remote_user" -c "/usr/local/bin/opencode --version"
