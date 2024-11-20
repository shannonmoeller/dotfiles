#!/usr/bin/env bash
set -x
shopt -s dotglob
shopt -s nullglob

DIR="$(dirname "$(dirname "$(realpath $0)")")"

for file in "$DIR"/src/*; do
    if [ -f "$file" ]; then
        ln -s "$file" "$HOME/$(basename "$file")"
    fi
done

for file in "$DIR"/src/.config/*; do
    ln -s "$file" "$HOME/.config/$(basename "$file")"
done
