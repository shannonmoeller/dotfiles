#!/usr/bin/env zsh
set -ex

brew update
brew install cmake
brew install coreutils
brew install fzf
brew install hub
brew install macvim --with-cscope --with-lua --with-override-system-vim
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
brew install the_silver_searcher
brew install tmux
brew install tree
brew install zsh-syntax-highlighting
