# Dev Images

This repository is the source of truth for reusable prebuilt devcontainer images.

## Images

- `ai-service`: the full service-oriented image, published as `ghcr.io/ausginer/devimages/ai-service`
- `node`: a lighter Node.js-focused image, published as `ghcr.io/ausginer/devimages/node`
- `node-bun`: a lighter Node.js 22 image with Bun, published as `ghcr.io/ausginer/devimages/node-bun`

## Using The Images

Use either image directly from a consumer repository's `devcontainer.json`:

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
  "name": "my-node-bun-project",
  "image": "ghcr.io/ausginer/devimages/node-bun:latest"
}
```

## Layout

- `images/<slug>/` contains one image definition and its local documentation
- `images/<slug>/.devcontainer/` contains the source config for that prebuilt image
- image-specific Dev Container Features live under `images/<slug>/.devcontainer/features/` when that image needs them
- `shared/features/` is reserved for future shared Dev Container Features
- `shared/scripts/` contains generic build and release helpers shared across images

## Current Status

`ai-service`, `node`, and `node-bun` are now real images in this repository.

GitHub Actions selectively build and publish only affected images. Docs-only changes do not trigger image builds.

This repository still does not add:

- sample consumer devcontainers
- sample smoke-test and cleanup scripts

Those will be added in a later step.
