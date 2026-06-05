# Dev Images

This repository is the source of truth for reusable prebuilt devcontainer images.

## Images

- `ai-service`: the full service-oriented image, published as `ghcr.io/ausginer/devimages/ai-service`
- `node`: a lighter Node.js-focused image, published as `ghcr.io/ausginer/devimages/node`
- `rust-bevy`: a Rust and Bevy-focused image with Cargo, WASM, and native build tooling, published as `ghcr.io/ausginer/devimages/rust-bevy`

## Using The Images

Use an image directly from a consumer repository's `devcontainer.json`:

```json
{
  "name": "my-service",
  "image": "ghcr.io/ausginer/devimages/ai-service:latest"
}
```

```json
{
  "name": "my-node-project",
  "image": "ghcr.io/ausginer/devimages/node:latest"
}
```

```json
{
  "name": "my-rust-bevy-project",
  "image": "ghcr.io/ausginer/devimages/rust-bevy:latest"
}
```

## Layout

- `images/<slug>/` contains one image definition and its local documentation
- `images/<slug>/.devcontainer/` contains the source config for that prebuilt image
- image-specific Dev Container Features live under `images/<slug>/.devcontainer/features/` when that image needs them
- `shared/features/` contains shared Dev Container Features copied into each image at build time
- `shared/scripts/` contains generic build and release helpers shared across images

## Current Status

`ai-service`, `node`, and `rust-bevy` are now real images in this repository.

GitHub Actions selectively build and publish only affected images. Docs-only changes do not trigger image builds.

This repository still does not add:

- sample consumer devcontainers
- sample smoke-test and cleanup scripts

Those will be added in a later step.
