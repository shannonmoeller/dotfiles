#!/usr/bin/env bash
set -x
shopt -s dotglob
shopt -s nullglob

DIR="$(dirname "$(dirname "$(realpath $0)")")"

mkdir -p "${HOME}/.config"

for SRC in "${DIR}"/src/.config/*; do
  DEST="${HOME}/.config/$(basename "${SRC}")"
  if [[ -d "${SRC}" ]] && [[ ! -e "${DEST}" ]]; then
    ln -s "${SRC}" "${DEST}"
  fi
done
