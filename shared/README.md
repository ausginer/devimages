# Shared

This directory reserves space for shared building blocks reused across multiple images.

## Layout

- `features/` for shared devcontainer features
- `scripts/` for shared helper scripts used by build and release flows

At this stage only generic shell helpers are shared. Image configs, image-local features, and sample/smoke helpers stay with the individual image until they need to be generalized.
