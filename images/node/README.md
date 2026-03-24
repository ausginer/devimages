# node

This directory contains the Node.js-focused prebuilt devcontainer image.

It keeps a lighter scope than `ai-service-starter` and is intended for projects that want Node.js tooling plus a system browser, without the extra Rust, Python, or PostgreSQL layers.

Its public package identity is:

```text
ghcr.io/<owner>/node
```

Recommended tags are:

- `latest`
- `vX.Y.Z`
- `vX.Y`
- `vX`

## What Gets Baked Into The Image

The prebuilt image starts from `node:25-bookworm-slim` and is assembled through a source `devcontainer.json` plus upstream features.

Included tooling:

- Node.js 25
- `ghcr.io/devcontainers/features/common-utils:2`
- Chrome for Testing via `ghcr.io/kreemer/features/chrometesting:1`

The image includes system Chrome for browser-based testing and sets `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1`, so Playwright's own browser binaries are not pre-downloaded into the image.

## Layout

- `image/devcontainer.json` contains the source config for the prebuilt image

This step does not add image-local features, sample consumer files, smoke tests, or workflow automation.
