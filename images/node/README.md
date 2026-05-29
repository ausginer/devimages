# node

This directory contains the Node.js-focused prebuilt devcontainer image.

It keeps a lighter scope than `ai-service` and is intended for projects that want Node.js tooling plus a system browser, without the extra Rust, Python, or PostgreSQL layers.

Its public package identity is:

```text
ghcr.io/ausginer/devimages/node
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
  "name": "my-node-project",
  "image": "ghcr.io/ausginer/devimages/node:latest"
}
```

## What Gets Baked Into The Image

The prebuilt image starts from `node:25-bookworm-slim` and is assembled through a source `devcontainer.json` plus upstream features.

Included tooling:

- Node.js 25
- `ghcr.io/devcontainers/features/common-utils:2`
- GitHub CLI via `ghcr.io/devcontainers/features/github-cli:1`
- SSH server via `ghcr.io/devcontainers/features/sshd:1`
- Chrome for Testing via `ghcr.io/kreemer/features/chrometesting:1`
- Claude Code CLI via `shared/features/claude-cli`
- Codex CLI via `shared/features/codex-cli`
- Dura via `shared/features/dura`
- Just via `shared/features/just`

The image includes system Chrome for browser-based testing and sets `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1`, so Playwright's own browser binaries are not pre-downloaded into the image.

It also includes GitHub CLI so `gh` and cloud/plugin-driven workflows have a consistent runtime available inside the devcontainer.

The SSH server feature enables editor integrations that connect over SSH, such as Zed's remote development mode.

Claude Code CLI and Codex CLI are installed via the shared features in this repository. Claude Code uses the official apt repository; Codex is installed as a global npm package.

The devcontainer user is `node`, matching the existing non-root user from the upstream `node` image. This avoids a Linux UID collision between `node` and a second `vscode` user, which can otherwise break write access on bind-mounted workspaces.

## Layout

- `.devcontainer/devcontainer.json` contains the source config for the prebuilt image
- `shared/features/claude-cli` installs the Claude Code CLI
- `shared/features/codex-cli` installs the Codex CLI
- `shared/features/dura` installs Dura
