# Python from uv

Installs a Python interpreter with uv and exposes its executables through `/usr/local/bin`.

## Usage

```json
"./features/uv-python": {
  "version": "latest"
}
```

`version` accepts a uv Python version request and defaults to `latest`. The feature requires uv and stores managed Python installations under `/opt/uv/python`.
