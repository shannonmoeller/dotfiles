#!/usr/bin/env bash
set -x
shopt -s nullglob

DIR="$(dirname "$(dirname "${BASH_SOURCE[0]}")")"

for file in "$DIR"/src/*; do
    if [ -f "$file" ]; then
        ln -s "$file" "$HOME/$(basename "$file")"
    fi
done
