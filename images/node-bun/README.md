# node-bun

This directory contains a Node.js-focused prebuilt devcontainer image with Bun.

It follows the same lightweight shape as `node`, but pins the upstream Node.js base image to Node.js 22.16.0 and bakes in Bun for projects that use Bun as their package manager or runtime.

Its public package identity is:

```text
ghcr.io/ausginer/devimages/node-bun
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
  "name": "my-node-bun-project",
  "image": "ghcr.io/ausginer/devimages/node-bun:latest"
}
```

## What Gets Baked Into The Image

The prebuilt image starts from `node:22.16.0-bookworm-slim` and is assembled through a source `devcontainer.json` plus upstream features.

Included tooling:

- Node.js 22.16.0
- Bun via `ghcr.io/devcontainers-extra/features/bun:1`
- `ghcr.io/devcontainers/features/common-utils:2`
- GitHub CLI via `ghcr.io/devcontainers/features/github-cli:1`
- Chrome for Testing via `ghcr.io/kreemer/features/chrometesting:1`

The Bun feature comes from the general-purpose `devcontainers-extra` collection. It exposes a `version` option, so this image can pin Bun later if needed while staying on the feature's major-version channel.

The image includes system Chrome for browser-based testing and sets `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1`, so Playwright's own browser binaries are not pre-downloaded into the image.

It also includes GitHub CLI so `gh` and cloud/plugin-driven workflows have a consistent runtime available inside the devcontainer.

The devcontainer user is `node`, matching the existing non-root user from the upstream `node` image. This avoids a Linux UID collision between `node` and a second `vscode` user, which can otherwise break write access on bind-mounted workspaces.

## Layout

- `.devcontainer/devcontainer.json` contains the source config for the prebuilt image

This repository-level workflow setup does not yet add image-local features, sample consumer files, or smoke tests for `node-bun`.
