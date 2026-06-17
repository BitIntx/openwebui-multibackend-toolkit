#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/common.sh"

export LOCAL_MEDIA_HOST="${LOCAL_MEDIA_HOST:-127.0.0.1}"
export LOCAL_MEDIA_PORT="${LOCAL_MEDIA_PORT:-9000}"
export LOCAL_MEDIA_DIR="${LOCAL_MEDIA_DIR:-${WORKSPACE_DIR}/media}"

mkdir -p "${LOCAL_MEDIA_DIR}"

exec python3 -m http.server "${LOCAL_MEDIA_PORT}" \
  --bind "${LOCAL_MEDIA_HOST}" \
  --directory "${LOCAL_MEDIA_DIR}"
