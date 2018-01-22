#!/usr/bin/env zsh

set -ex

# Order is important

zsh setup/brew.sh
zsh setup/node.sh

ln -s "$(dirname $(dirname "$(realpath "$0")"))/.zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"

zsh setup/vim.sh
zsh setup/bin.sh
