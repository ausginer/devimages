#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${IMAGE_NAME:-}" || -z "${PRIMARY_TAG:-}" || -z "${PUBLISH:-}" || -z "${CONFIG_PATH:-}" ]]; then
  echo "IMAGE_NAME, PRIMARY_TAG, PUBLISH, and CONFIG_PATH are required." >&2
  exit 1
fi

workspace_folder="${WORKSPACE_FOLDER:-.}"
platform="${PLATFORM:-linux/amd64}"
config_path="${CONFIG_PATH}"

if [[ "${config_path}" != /* ]]; then
  if [[ "${workspace_folder}" == "." ]]; then
    config_path="./${config_path}"
  else
    config_path="${workspace_folder%/}/${config_path}"
  fi
fi

repo_root="$(cd "$(dirname "$0")/../.." && pwd)"
devcontainer_dir="$(dirname "${config_path}")"
shared_features_src="${repo_root}/shared/features"
shared_features_dst="${devcontainer_dir}/features"

if [[ -d "${shared_features_src}" ]]; then
  mkdir -p "${shared_features_dst}"
  cp -r "${shared_features_src}/." "${shared_features_dst}/"
fi

args=(
  build
  --workspace-folder "${workspace_folder}"
  --config "${config_path}"
  --platform "${platform}"
  --image-name "${IMAGE_NAME}:${PRIMARY_TAG}"
)

if [[ "${PUBLISH}" == "true" ]]; then
  args+=(--push true)
fi

devcontainer "${args[@]}"
