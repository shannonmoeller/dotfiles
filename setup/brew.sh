#!/usr/bin/env zsh

set -ex

# homebrew

if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install cmake
brew install coreutils
brew install hub
brew install macvim --with-override-system-vim
brew install n
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
brew install the_silver_searcher
brew install tmux
brew install tree
brew install zsh-syntax-highlighting
