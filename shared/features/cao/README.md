# CAO - CLI Agent Orchestrator

Installs the CLI Agent Orchestrator, its Python package, and tmux 3.3 or newer. The optional entrypoint can start `cao-server` when the container starts.

## Usage

```json
"./features/cao": {
  "version": "latest",
  "webui": false,
  "port": "9889",
  "autostart": false
}
```

- `version` selects a Git tag, branch, commit, or the latest default branch
- `webui` builds the web frontend and requires npm
- `port` sets the default server port
- `autostart` starts `cao-server` from the feature entrypoint

The feature installs Python through its declared dependency. It supports apt- and apk-based images for system dependencies.

This directory is a temporary, vendored copy of the CLI Agent Orchestrator
devcontainer feature from the awslabs `cli-agent-orchestrator` repository:

```text
https://github.com/awslabs/cli-agent-orchestrator
```

## Temporary Status

This feature is kept here only because the upstream CAO devcontainer feature is
not yet published to a registry that this repository can consume directly.

Once the upstream feature is published, this local copy should be removed and
image definitions should reference the published upstream feature instead.

## Ownership And Attribution

All CAO feature code in this directory belongs to the awslabs
`cli-agent-orchestrator` project and its contributors.

This repository does not claim ownership of the CAO implementation. The local
copy exists only to make the feature available during image builds until the
official feature can be consumed directly.

## License

The upstream `cli-agent-orchestrator` project is licensed under Apache-2.0.
Keep the upstream license and notice requirements in mind when updating,
redistributing, or removing this vendored copy.
