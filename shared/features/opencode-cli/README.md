# OpenCode CLI

Installs OpenCode for a non-root container user with the official installer and exposes it through `/usr/local/bin/opencode`.

## Usage

```json
"./features/opencode-cli": {
  "username": "node"
}
```

`username` defaults to `node`. The feature also honors the Dev Container `_REMOTE_USER` and `_CONTAINER_USER` variables when no explicit option is supplied. The selected user must already exist, and `bash` and `curl` must be available.
