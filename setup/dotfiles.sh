#!/usr/bin/env bash
set -x
shopt -s dotglob
shopt -s nullglob

DIR="$(dirname "$(dirname "$(realpath $0)")")"

for SRC in "${DIR}"/src/*; do
  DEST="${HOME}/$(basename "${SRC}")"
  if [[ -f "${SRC}" ]] && [[ ! -e "${DEST}" ]]; then
    ln -s "${SRC}" "${DEST}"
  fi
done
