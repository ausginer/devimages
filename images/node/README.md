# node

The general Node.js devcontainer image, published as:

```text
ghcr.io/ausginer/devimages/node
```

Use `latest`, a full release tag such as `v1.2.3`, or its `v1.2` and `v1` aliases.

## Usage

```json
{
  "name": "my-node-project",
  "image": "ghcr.io/ausginer/devimages/node:latest"
}
```

## Included Tooling

The image starts from `node:slim` and adds:

- common command-line utilities and the GitHub CLI
- Rust and Cargo, used by Cargo-installed utilities
- uv and a uv-managed Python installation
- Chrome for Testing; `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1` avoids a second browser cache
- an SSH server, lazygit, and Helix
- Claude Code, Codex, OpenCode, Dura, and Just

The container runs as the upstream `node` user with `updateRemoteUserUID` enabled.

## Source

- `.devcontainer/devcontainer.json` defines the image
- `shared/features/` supplies the shared local features
