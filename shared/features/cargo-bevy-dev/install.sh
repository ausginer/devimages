#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y --no-install-recommends \
    bash-completion \
    ca-certificates \
    curl \
    git \
    git-lfs \
    less \
    jq \
    ripgrep \
    fd-find \
    pkg-config \
    build-essential \
    clang \
    lld \
    lldb \
    mold \
    cmake \
    make \
    protobuf-compiler \
    libssl-dev \
    libsqlite3-dev \
    libx11-dev \
    libasound2-dev \
    libudev-dev \
    libxkbcommon-x11-0 \
    libwayland-dev \
    libxkbcommon-dev \
    wayland-protocols

rm -rf /var/lib/apt/lists/*

rustup component add \
    rustfmt \
    clippy \
    rust-src \
    rust-analyzer

rustup target add \
    wasm32-wasip1 \
    wasm32-wasip2 \
    wasm32-unknown-unknown

cargo install --locked \
    cargo-nextest \
    cargo-expand \
    cargo-audit \
    sccache \
    wasm-tools

curl -fsSL https://wasmtime.dev/install.sh | bash
install -m 0755 "$HOME/.wasmtime/bin/wasmtime" /usr/local/bin/wasmtime
rm -rf "$HOME/.wasmtime"
