#!/bin/sh
set -eu

version="${VERSION:-latest}"
install_dir="${UV_PYTHON_INSTALL_DIR:-/opt/uv/python}"
bin_dir="${UV_PYTHON_BIN_DIR:-/usr/local/bin}"

if ! command -v uv >/dev/null 2>&1; then
  echo "uv must be installed before the uv-python feature runs." >&2
  exit 1
fi

mkdir -p "$install_dir" "$bin_dir"

export UV_PYTHON_INSTALL_DIR="$install_dir"
export UV_PYTHON_BIN_DIR="$bin_dir"

if [ "$version" = "latest" ] || [ -z "$version" ]; then
  uv python install --default --force
else
  uv python install "$version" --default --force
fi

python --version
