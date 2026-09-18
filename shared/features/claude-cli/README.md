# Claude Code CLI

Installs Claude Code for a non-root container user with Anthropic's official installer and adds `$HOME/.local/bin` to that user's Bash path.

## Usage

```json
"./features/claude-cli": {
  "username": "node"
}
```

`username` defaults to `node`. The feature also honors the Dev Container `_REMOTE_USER` and `_CONTAINER_USER` variables when no explicit option is supplied. The selected user must already exist, and `curl` must be available.
