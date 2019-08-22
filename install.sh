#!/usr/bin/env bash
set -x

# dotfiles

./setup/dotfiles.sh

# bin

./setup/bin.sh

# apt-get

if [[ "$(uname)" == Linux ]]; then
    ./setup/apt.sh
fi

# brew

if [[ "$(uname)" == Darwin ]]; then
    if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    ./setup/homebrew.sh
fi

if [[ "$(uname)" == Linux ]]; then
    if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    fi

    ./setup/linuxbrew.sh
fi

# node

if ! [[ -x "$(command -v nvm 2>/dev/null)" ]]; then
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/creationix/nvm/master/install.sh)"
fi

if ! [[ -x "$(command -v npm 2>/dev/null)" ]]; then
    [ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
    nvm install lts/*
    nvm alias default lts/*
fi

./setup/npm.sh

# vim

./setup/vim.sh

# zsh

if ! [[ -x "$(command -v zplug 2>/dev/null)" ]]; then
    /usr/bin/env zsh -c "$(curl -fsSL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh)"
fi
