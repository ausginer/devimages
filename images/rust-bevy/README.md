# rust-bevy

This directory contains the Rust and Bevy-focused prebuilt devcontainer image.

It is intended for Rust and Bevy projects that want a ready-to-use Cargo development environment with common native build dependencies, WASM targets, and agent/editor tooling.

Its public package identity is:

```text
ghcr.io/ausginer/devimages/rust-bevy
```

Recommended tags are:

- `latest`
- `vX.Y.Z`
- `vX.Y`
- `vX`

## Using The Image

Use the image from a consumer repository's `devcontainer.json`:

```json
{
  "name": "my-rust-bevy-project",
  "image": "ghcr.io/ausginer/devimages/rust-bevy:latest"
}
```

## What Gets Baked Into The Image

The prebuilt image starts from `rust:slim` and is assembled through a source `devcontainer.json` plus upstream and shared features.

Included tooling:

- Rust toolchain from the upstream `rust:slim` image
- `ghcr.io/devcontainers/features/common-utils:2`
- GitHub CLI via `ghcr.io/devcontainers/features/github-cli:1`
- Cargo and native build tooling via `shared/features/cargo-bevy-dev`
- Claude Code CLI via `shared/features/claude-cli`
- Codex CLI via `shared/features/codex-cli`
- Dura via `shared/features/dura`

The Cargo development feature installs common build dependencies, Rust components, WASM targets, Cargo tools, and Wasmtime. It includes `rustfmt`, `clippy`, `rust-src`, `rust-analyzer`, `cargo-nextest`, `cargo-expand`, `cargo-audit`, `sccache`, and `wasm-tools`.

It also includes GitHub CLI so `gh` and cloud/plugin-driven workflows have a consistent runtime available inside the devcontainer.

Claude Code CLI and Codex CLI are installed via the shared features in this repository. Claude Code uses the official apt repository; Codex is installed as a global npm package.

The devcontainer user is `dev`, created by the common-utils feature, and the config enables `updateRemoteUserUID`. This keeps Linux bind-mounted workspaces writable without relying on the root user from the upstream Rust image.

## Layout

- `.devcontainer/devcontainer.json` contains the source config for the prebuilt image
- `shared/features/cargo-bevy-dev` installs Rust, Cargo, WASM, and native build tooling
- `shared/features/claude-cli` installs the Claude Code CLI
- `shared/features/codex-cli` installs the Codex CLI
- `shared/features/dura` installs Dura
