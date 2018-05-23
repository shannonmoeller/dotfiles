#!/usr/bin/env zsh
set -ex

# dotfiles

for file in $(ls -d src/.*); do
	ln -s "$PWD/$file" "$HOME/$(basename "$file")"
done

# manual

./install-bin.sh

# homebrew

if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

./install-brew.sh

# node

if ! [[ -x "$(command -v nvm 2>/dev/null)" ]]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
fi

if ! [[ -x "$(command -v npm 2>/dev/null)" ]]; then
    [ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
    nvm install lts/*
    nvm alias default lts/*
fi

./install-npm.sh

# vim

./install-vim.sh
