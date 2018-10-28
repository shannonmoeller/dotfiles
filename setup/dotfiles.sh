#!/usr/bin/env zsh
set -x

for file in $(ls -d src/.*); do
	ln -s "$PWD/$file" "$HOME/$(basename "$file")"
done
