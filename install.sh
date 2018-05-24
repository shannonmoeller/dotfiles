#!/usr/bin/env zsh
set -x

# dotfiles

for file in $(ls -d src/.*); do
	ln -s "$PWD/$file" "$HOME/$(basename "$file")"
done

# bin

./setup/bin.sh

# brew

if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

./setup/brew.sh

# node

if ! [[ -x "$(command -v nvm 2>/dev/null)" ]]; then
    /usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/creationix/nvm/master/install.sh)"
fi

if ! [[ -x "$(command -v npm 2>/dev/null)" ]]; then
    [ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
    nvm install lts/*
    nvm alias default lts/*
fi

./setup/npm.sh

# vim

./setup/vim.sh
