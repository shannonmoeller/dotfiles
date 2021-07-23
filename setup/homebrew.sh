#!/usr/bin/env bash
set -x

[ "$(uname)" != Darwin ] && exit

if ! [ -x "$(command -v brew 2>/dev/null)" ]; then
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install cmake
brew install coreutils
brew install hub
brew install macvim --with-cscope --with-lua --with-override-system-vim
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
brew install the_silver_searcher
brew install tmux
brew install tree
brew upgrade
