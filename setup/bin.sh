#!/usr/bin/env bash
set -x
shopt -s nullglob

DIR="$(dirname "$(dirname "$(realpath $0)")")"

mkdir -p "${HOME}/bin"
curl -o "${HOME}/bin/bulk" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh
chmod +x "${HOME}/bin/bulk"

for SRC in "${DIR}"/src/.bin/*; do
  DEST="${HOME}/.bin/$(basename "${SRC}")"
  if [[ -f "${SRC}" ]] && [[ ! -e "${DEST}" ]]; then
    ln -s "${SRC}" "${DEST}"
  fi
done
