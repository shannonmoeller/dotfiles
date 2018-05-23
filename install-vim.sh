#!/usr/bin/env zsh
set -ex

curl --create-dirs -o "$HOME/.vim/autoload/plug.vim" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa
