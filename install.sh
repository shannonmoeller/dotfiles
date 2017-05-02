#!/usr/bin/env sh

set -ex

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install cmake
brew install coreutils
brew install hub
brew install macvim --with-override-system-vim
brew install n
brew install the_silver_searcher
brew install tmux
brew install tree

n lts

npm install -g diff-so-fancy
npm install -g eslint_d
npm install -g editorconfig
npm install -g http-server
npm install -g stylelint_d

ln -s "$(dirname "$(realpath "$0")")/.zshrc" "$HOME/.zshrc"

vim +PlugInstall +qa
