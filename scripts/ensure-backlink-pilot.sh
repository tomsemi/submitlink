#!/usr/bin/env bash
set -euo pipefail

repo_url="${BACKLINK_PILOT_REPO:-https://github.com/s87343472/backlink-pilot.git}"
target="${1:-${BACKLINK_PILOT_DIR:-$PWD/work/backlink-pilot}}"

if [[ -f "$PWD/package.json" ]] && grep -q '"name"[[:space:]]*:[[:space:]]*"backlink-pilot"' "$PWD/package.json"; then
  target="$PWD"
fi

if [[ ! -d "$target/.git" ]]; then
  mkdir -p "$(dirname "$target")"
  git clone "$repo_url" "$target"
fi

cd "$target"

if [[ ! -f package.json ]]; then
  echo "Not a backlink-pilot checkout: $target" >&2
  exit 1
fi

if [[ "${BACKLINK_PILOT_SKIP_INSTALL:-0}" != "1" && ! -d node_modules ]]; then
  npm install
fi

printf '%s\n' "$PWD"
