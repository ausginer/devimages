#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo must be installed before the cargo-tools feature runs." >&2
  exit 1
fi

apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  pkg-config

if ! cargo sqlx --version >/dev/null 2>&1; then
  cargo install \
    --locked \
    --root /usr/local \
    --no-default-features \
    --features rustls,postgres \
    sqlx-cli
fi

if ! command -v sqruff >/dev/null 2>&1; then
  cargo install \
    --locked \
    --root /usr/local \
    sqruff
fi

if ! cargo expand --version >/dev/null 2>&1; then
  cargo install \
    --locked \
    --root /usr/local \
    cargo-expand
fi

apt-get clean
rm -rf /var/lib/apt/lists/*
