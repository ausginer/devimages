#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${GITHUB_OUTPUT:-}" ]]; then
  echo "GITHUB_OUTPUT is required." >&2
  exit 1
fi

if [[ "${GITHUB_EVENT_NAME:-}" == "pull_request" ]]; then
  primary_tag="pr-${GITHUB_SHA::12}"
  publish="false"
  alias_tags=""
elif [[ "${GITHUB_REF_TYPE:-}" == "branch" && "${GITHUB_REF_NAME:-}" == "main" ]]; then
  primary_tag="latest"
  publish="true"
  alias_tags=""
elif [[ "${GITHUB_REF_TYPE:-}" == "tag" ]]; then
  version="${GITHUB_REF_NAME#v}"
  major="${version%%.*}"
  remainder="${version#*.}"
  minor="${remainder%%.*}"

  if [[ "${version}" == "${remainder}" || -z "${minor}" ]]; then
    echo "Release tags must use semver, for example v1.2.3." >&2
    exit 1
  fi

  primary_tag="v${version}"
  publish="true"
  alias_tags="v${major}.${minor} v${major}"
else
  echo "Unsupported ref: ${GITHUB_REF:-unknown}" >&2
  exit 1
fi

{
  echo "primary_tag=${primary_tag}"
  echo "publish=${publish}"
  echo "alias_tags=${alias_tags}"
} >> "${GITHUB_OUTPUT}"
