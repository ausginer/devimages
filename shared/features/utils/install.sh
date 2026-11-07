#!/bin/sh
set -eu

if command -v rg >/dev/null 2>&1 && command -v resize >/dev/null 2>&1; then
  exit 0
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends ripgrep

# Debian ships resize only inside the full xterm package, which pulls in the
# X11 stack. The resize binary itself depends only on libc, so extract it alone.
if ! command -v resize >/dev/null 2>&1; then
  workdir="$(mktemp -d)"
  trap 'rm -rf "${workdir}"' EXIT

  (cd "${workdir}" && apt-get download xterm)
  dpkg-deb -x "${workdir}"/xterm_*.deb "${workdir}/xterm"
  install -m 0755 "${workdir}/xterm/usr/bin/resize" /usr/local/bin/resize
fi

apt-get clean
rm -rf /var/lib/apt/lists/*

rg --version
command -v resize
