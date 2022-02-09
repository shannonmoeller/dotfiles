#!/usr/bin/env bash
set -x
shopt -s nullglob

DIR="$(dirname "$(dirname "$(realpath $0)")")"

mkdir -p "$HOME/bin"
curl -o "$HOME/bin/bulk" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh

for file in "$DIR"/src/bin/*; do
    if [ -f "$file" ]; then
        ln -s "$file" "$HOME/bin/$(basename "$file")"
    fi
done
