#!/usr/bin/env bash
set -x
shopt -s nullglob

for file in src/.[[:lower:]]*; do
	ln -s "$PWD/$file" "$HOME/$(basename "$file")"
done
