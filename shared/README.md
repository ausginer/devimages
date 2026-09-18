# Shared

This directory reserves space for shared building blocks reused across multiple images.

## Layout

- `features/` for shared devcontainer features
- `scripts/` for shared helper scripts used by build and release flows

Shared features currently include:

- `cao`: CLI Agent Orchestrator (multi-agent orchestration framework)
- `bevy-dev`: Linux native libraries and Wasmtime for Bevy applications
- `claude-cli`: Claude Code CLI
- `codex-cli`: Codex CLI
- `dura`: Dura
- `helixdb-cli`: HelixDB CLI
- `just`: Just
- `minio-cli`: MinIO Client (`mc`)
- `opencode-cli`: OpenCode CLI
- `rust-dev`: native build dependencies, Rust components and targets, and Cargo tools
- `uv-python`: Python toolchain managed by uv

The scripts in this directory detect changed images, resolve publish tags, build prebuilt devcontainer images, and push release aliases. Image configs, image-local features, and sample/smoke helpers stay with the individual image until they need to be generalized.
