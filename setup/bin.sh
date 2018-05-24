#!/usr/bin/env zsh
set -x

curl --create-dirs -o "$HOME/.config/bulk/bulk.sh" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh
curl --create-dirs -o "$HOME/.config/up/up.sh" https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
