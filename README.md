# Dev Images

This repository is the source of truth for reusable prebuilt devcontainer images.

## Images

- `ai-service-starter`: the migrated legacy image, published as `ghcr.io/<owner>/ai-service-starter`
- `node`: a lighter Node.js-focused image, published as `ghcr.io/<owner>/node`

`ai-service-starter` now lives in this repository. The old local repository name `~/opensource/ai-dev-img` is historical only.

## Layout

- `images/<slug>/` contains one image definition and its local documentation
- `images/<slug>/image/` contains the source config for that prebuilt image
- `images/<slug>/features/` contains image-specific Dev Container Features
- `shared/features/` is reserved for future shared Dev Container Features
- `shared/scripts/` contains generic build and release helpers shared across images

## Current Status

`ai-service-starter` and `node` are now real images in this repository.

This step intentionally does not add:

- GitHub Actions workflows
- GHCR auto-publish wiring
- sample consumer devcontainers
- sample smoke-test and cleanup scripts

Those will be added in a later step after the multi-image structure is in place.
