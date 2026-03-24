#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${GITHUB_OUTPUT:-}" ]]; then
  echo "GITHUB_OUTPUT is required." >&2
  exit 1
fi

image_slugs=(ai-service node)
declare -A image_names=(
  [ai-service]="ghcr.io/ausginer/devimages/ai-service"
  [node]="ghcr.io/ausginer/devimages/node"
)
declare -A config_paths=(
  [ai-service]="images/ai-service/.devcontainer/devcontainer.json"
  [node]="images/node/.devcontainer/devcontainer.json"
)
declare -A selected=()
changed_files=()
collect_all="false"

if [[ "${GITHUB_EVENT_NAME:-}" == "workflow_dispatch" ]]; then
  collect_all="true"
elif [[ "${GITHUB_EVENT_NAME:-}" == "pull_request" ]]; then
  if [[ -z "${PR_BASE_SHA:-}" || -z "${PR_HEAD_SHA:-}" ]]; then
    echo "PR_BASE_SHA and PR_HEAD_SHA are required for pull_request events." >&2
    exit 1
  fi

  mapfile -t changed_files < <(git diff --name-only "${PR_BASE_SHA}" "${PR_HEAD_SHA}")
elif [[ "${GITHUB_REF_TYPE:-}" == "branch" && "${GITHUB_REF_NAME:-}" == "main" ]]; then
  if [[ -z "${EVENT_BEFORE:-}" || "${EVENT_BEFORE}" == "0000000000000000000000000000000000000000" ]]; then
    collect_all="true"
  else
    mapfile -t changed_files < <(git diff --name-only "${EVENT_BEFORE}" "${GITHUB_SHA}")
  fi
elif [[ "${GITHUB_REF_TYPE:-}" == "tag" ]]; then
  previous_tag=""
  if git rev-parse "${GITHUB_SHA}^" >/dev/null 2>&1; then
    previous_tag="$(git describe --tags --abbrev=0 "${GITHUB_SHA}^" --match 'v*' 2>/dev/null || true)"
  fi

  if [[ -z "${previous_tag}" ]]; then
    collect_all="true"
  else
    mapfile -t changed_files < <(git diff --name-only "${previous_tag}" "${GITHUB_SHA}")
  fi
else
  echo "Unsupported event: ${GITHUB_EVENT_NAME:-unknown} ${GITHUB_REF_TYPE:-}" >&2
  exit 1
fi

if [[ "${collect_all}" == "true" ]]; then
  for slug in "${image_slugs[@]}"; do
    selected["${slug}"]=1
  done
else
  for file in "${changed_files[@]}"; do
    [[ -z "${file}" ]] && continue

    if [[ "${file}" == images/ai-service/.devcontainer/* || "${file}" == shared/scripts/* ]]; then
      selected["ai-service"]=1
    fi

    if [[ "${file}" == images/node/.devcontainer/* || "${file}" == shared/scripts/* ]]; then
      selected["node"]=1
    fi
  done
fi

selected_slugs=()
for slug in "${image_slugs[@]}"; do
  if [[ -n "${selected[${slug}]:-}" ]]; then
    selected_slugs+=("${slug}")
  fi
done

if ((${#selected_slugs[@]} == 0)); then
  {
    echo 'has_changes=false'
    echo 'matrix={"include":[]}'
  } >> "${GITHUB_OUTPUT}"
  exit 0
fi

printf 'Selected images: %s\n' "${selected_slugs[*]}"
if ((${#changed_files[@]} > 0)); then
  printf 'Changed files:\n%s\n' "${changed_files[@]}"
else
  echo "Changed files: <full publish scope>"
fi

matrix_json='{"include":['
for i in "${!selected_slugs[@]}"; do
  slug="${selected_slugs[$i]}"
  if ((i > 0)); then
    matrix_json+=","
  fi
  matrix_json+="{\"slug\":\"${slug}\",\"image_name\":\"${image_names[$slug]}\",\"config_path\":\"${config_paths[$slug]}\"}"
done
matrix_json+="]}"

{
  echo "has_changes=true"
  echo "matrix=${matrix_json}"
} >> "${GITHUB_OUTPUT}"
