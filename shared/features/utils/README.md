# Utils

Installs common terminal utilities:

- `rg` (ripgrep) from the distribution packages
- `resize` from xterm, which syncs the terminal size after attaching to a container or serial console

## Usage

```json
"./features/utils": {}
```

The feature requires an apt-based image. Debian ships `resize` only in the full `xterm` package, so the feature downloads that package and extracts only the `resize` binary into `/usr/local/bin`, avoiding the X11 runtime libraries.
