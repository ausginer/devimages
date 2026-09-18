# rust

The general Rust devcontainer image, published as:

```text
ghcr.io/ausginer/devimages/rust
```

Use `latest`, a full release tag such as `v1.2.3`, or its `v1.2` and `v1` aliases.

## Usage

```json
{
  "name": "my-rust-project",
  "image": "ghcr.io/ausginer/devimages/rust:latest"
}
```

## Included Tooling

The image starts from `rust:slim` and adds:

- native Rust build tools and libraries, including Clang, LLD, LLDB, mold, CMake, Protobuf, OpenSSL, and SQLite development files
- `rustfmt`, Clippy, Rust source, and rust-analyzer
- `wasm32-wasip1`, `wasm32-wasip2`, and `wasm32-unknown-unknown` targets
- `cargo-nextest`, `cargo-expand`, `cargo-audit`, `sccache`, `wasm-tools`, and Wasmtime
- Node.js, uv, and a uv-managed Python installation
- common command-line utilities, GitHub CLI, an SSH server, lazygit, and Helix
- Claude Code, Codex, OpenCode, Dura, and Just

The container runs as the non-root `dev` user created by `common-utils`, with `updateRemoteUserUID` enabled.

## Source

- `.devcontainer/devcontainer.json` defines the image
- `shared/features/rust-dev/` installs the Rust development toolchain additions
- `shared/features/` supplies the other shared local features
