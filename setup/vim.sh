#!/usr/bin/env bash
set -x

if ! [ -e "$HOME/.vim/autoload/plug.vim" ]; then
    curl --create-dirs -o "$HOME/.vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p "$HOME/.vim/sessions"
vim +PlugInstall +qa
