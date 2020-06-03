#!/usr/bin/env bash
set -x

mkdir -p "$HOME/.tmux/plugins/"
git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
