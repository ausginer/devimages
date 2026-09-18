# Bevy Development Dependencies

Installs the Debian libraries needed to compile Bevy applications with Linux windowing, input, and audio support: X11, Wayland, udev, xkbcommon, and ALSA.

## Usage

```json
"./features/bevy-dev": {}
```

The feature expects an apt-based image with the general Rust build toolchain already installed. In this repository it is applied by `rust-bevy` on top of the `rust` image.
