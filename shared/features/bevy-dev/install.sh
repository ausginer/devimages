#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libx11-dev \
    libasound2-dev \
    libudev-dev \
    libxkbcommon-x11-0 \
    libwayland-dev \
    libxkbcommon-dev \
    wayland-protocols

rm -rf /var/lib/apt/lists/*

curl -fsSL https://wasmtime.dev/install.sh | bash
install -m 0755 "$HOME/.wasmtime/bin/wasmtime" /usr/local/bin/wasmtime
rm -rf "$HOME/.wasmtime"
