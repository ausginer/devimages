#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${IMAGE_NAME:-}" || -z "${PRIMARY_TAG:-}" ]]; then
  echo "IMAGE_NAME and PRIMARY_TAG are required." >&2
  exit 1
fi

if [[ -z "${ALIAS_TAGS:-}" ]]; then
  echo "No alias tags to push."
  exit 0
fi

for tag in ${ALIAS_TAGS}; do
  docker tag "${IMAGE_NAME}:${PRIMARY_TAG}" "${IMAGE_NAME}:${tag}"
  docker push "${IMAGE_NAME}:${tag}"
done
