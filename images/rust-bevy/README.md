# rust-bevy

The Bevy-focused devcontainer image, published as:

```text
ghcr.io/ausginer/devimages/rust-bevy
```

Use `latest`, a full release tag such as `v1.2.3`, or its `v1.2` and `v1` aliases.

## Usage

```json
{
  "name": "my-rust-bevy-project",
  "image": "ghcr.io/ausginer/devimages/rust-bevy:latest"
}
```

## Included Tooling

This image extends `ghcr.io/ausginer/devimages/rust`. It inherits the complete Rust, WASM, language, agent, editor, and command-line toolset documented in [`../rust/README.md`](../rust/README.md), then adds Wasmtime and the X11, Wayland, udev, keyboard, and ALSA development libraries needed for Bevy games on Linux.

The source config defaults to `ghcr.io/ausginer/devimages/rust:latest`. CI sets `RUST_IMAGE_TAG` when it builds a matching Rust base first, ensuring that a Rust change and its dependent Bevy image are built from the same source revision.

## Source

- `.devcontainer/devcontainer.json` selects the Rust base and applies the Bevy feature
- `shared/features/bevy-dev/` installs Bevy's native Linux dependencies
