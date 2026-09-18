# ai-service

The full service-oriented devcontainer image, published as:

```text
ghcr.io/ausginer/devimages/ai-service
```

Use `latest`, a full release tag such as `v1.2.3`, or its `v1.2` and `v1` aliases.

## Usage

```json
{
  "name": "my-service",
  "image": "ghcr.io/ausginer/devimages/ai-service:latest"
}
```

## Included Tooling

The image starts from `node:slim` and adds:

- common command-line utilities and the GitHub CLI
- Rust and Cargo
- uv and a uv-managed Python installation
- PostgreSQL client tools
- Chrome for Testing; `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1` avoids a second browser cache
- an SSH server, lazygit, and Helix
- `sqlx-cli`, `sqruff`, and `cargo-expand`
- Claude Code, Codex, OpenCode, Dura, and Just

The container runs as the upstream `node` user with `updateRemoteUserUID` enabled. `CARGO_HOME`, Cargo's binary directory, and the uv cache are configured for that user's home directory.

## Source

- `.devcontainer/devcontainer.json` defines the image
- `.devcontainer/features/cargo-tools/` installs the image-specific Cargo tools
- `shared/features/` supplies the shared local features
