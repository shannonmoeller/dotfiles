#!/usr/bin/env bash
set -x

./setup/dotfiles.sh
./setup/bin.sh

./setup/apt.sh
./setup/linuxbrew.sh
./setup/homebrew.sh
./setup/npm.sh
./setup/tmux.sh
./setup/vim.sh
./setup/zsh.sh
