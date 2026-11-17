# Playwright WebKit System Dependencies

Installs the Debian packages that Playwright's WebKit build needs, using `playwright install-deps webkit` for an exact Playwright version. The set includes GStreamer and its plugins, GTK 4, Mesa's GL, `xvfb`, and several fallback font packages.

## Usage

```json
"./features/playwright-webkit-deps": {
  "version": "1.65.0"
}
```

The feature installs only the system libraries, which need root and apt and are slow to install. It does not install the WebKit browser build. The browser build follows the consumer's lockfile, lives in the user's `~/.cache/ms-playwright`, and is quick to download, so consumers install it from their own devcontainer scripts.

When a consumer updates Playwright, the library set can change. Update `version` to the consumer's Playwright version and rebuild the image.

The feature requires an apt-based image with Node and npm. It cleans the apt lists and npm cache afterwards.
