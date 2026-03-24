# ai-service

This directory contains the `ai-service` image.

It is now maintained from this repository and keeps the same public package identity:

```text
ghcr.io/ausginer/devimages/ai-service
```

Recommended tags remain:

- `latest`
- `vX.Y.Z`
- `vX.Y`
- `vX`

## Using The Image

Use the image from a consumer repository's `devcontainer.json`:

```json
{
  "name": "my-service",
  "image": "ghcr.io/ausginer/devimages/ai-service:latest"
}
```

## What Gets Baked Into The Image

The prebuilt image starts from `node:25-bookworm-slim` and is assembled through a source `devcontainer.json` plus image-local and upstream features.

Included tooling:

- Node.js 25
- Rust toolchain
- Python 3.14
- `uv`
- PostgreSQL client
- Cargo tooling: `sqlx-cli`, `sqruff`, `cargo-expand`
- Chrome for Testing via `ghcr.io/kreemer/features/chrometesting:1`

The image includes Chrome for Testing, but does not bake in Playwright's own browser download cache.

The devcontainer user is `node`, matching the existing non-root user from the upstream `node` image, and the config enables `updateRemoteUserUID`. This keeps Linux bind-mounted workspaces writable without introducing a second `vscode` user that would conflict with UID `1000`.

## Layout

- `.devcontainer/devcontainer.json` contains the source config for the prebuilt image
- `.devcontainer/features/cargo-tools/` contains the image-local Cargo tooling feature

This repository-level workflow setup does not yet include sample consumer files or smoke tests for `ai-service`.
