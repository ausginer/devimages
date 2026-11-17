# aube

Installs the aube package manager (`@endevco/aube`) globally into `/usr/local` with npm.

## Usage

```json
"./features/aube": {
  "version": "2.10.0"
}
```

`version` must be an exact release. Consumers pin aube in `package.json`'s `packageManager` field and fail the install on any other version, so the image must carry exactly the version they name. When a consumer moves its pin, update this option and rebuild the image.

The package downloads its platform binary in a `preinstall` script, so the feature installs it with `--ignore-scripts=false`. The build fails if `aube --version` doesn't run afterwards.

The feature sets no `AUBE_*` environment variables. aube uses the user's XDG data and cache directories by default, and an environment value would override the consumer's `.npmrc` settings.
