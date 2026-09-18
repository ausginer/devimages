# Rust Development Tools

Adds the common native, Cargo, and WebAssembly tooling used by the `rust` image.

## Installed Tooling

- Clang, LLD, LLDB, mold, CMake, Make, Protobuf, OpenSSL, and SQLite development files
- `rustfmt`, Clippy, Rust source, and rust-analyzer
- `wasm32-wasip1`, `wasm32-wasip2`, and `wasm32-unknown-unknown` targets
- `cargo-nextest`, `cargo-expand`, `cargo-audit`, `sccache`, and `wasm-tools`

## Usage

```json
"./features/rust-dev": {}
```

The feature expects an apt-based image with `rustup` and Cargo available.
