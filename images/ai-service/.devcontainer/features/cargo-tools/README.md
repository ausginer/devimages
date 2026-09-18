# Cargo Tools

Image-local feature for `ai-service`. It installs:

- `sqlx-cli` with Rustls and PostgreSQL support
- `sqruff`
- `cargo-expand`

## Usage

```json
"./features/cargo-tools": {}
```

The feature requires Cargo and an apt-based image. It is kept image-local because this exact tool bundle is specific to `ai-service`.
