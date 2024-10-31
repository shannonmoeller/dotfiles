#!/usr/bin/env bash
set -x

./setup/dotfiles.sh
./setup/bin.sh

./setup/apt.sh
./setup/homebrew.sh
./setup/node.sh
./setup/python.sh
./setup/tmux.sh
./setup/vim.sh
./setup/zsh.sh
