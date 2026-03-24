# ai-service-starter

This directory contains the migrated `ai-service-starter` image.

It is now maintained from this repository and keeps the same public package identity:

```text
ghcr.io/<owner>/ai-service-starter
```

Recommended tags remain:

- `latest`
- `vX.Y.Z`
- `vX.Y`
- `vX`

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

## Layout

- `image/devcontainer.json` contains the source config for the prebuilt image
- `features/cargo-tools/` contains the image-local Cargo tooling feature

This migration step does not yet include sample consumer files, smoke tests, or workflow automation.
