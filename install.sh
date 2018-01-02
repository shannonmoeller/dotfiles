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

# node

n lts

npm install -g diff-so-fancy
npm install -g editorconfig
npm install -g eslint_d
npm install -g npm-check-updates
npm install -g npmrc
npm install -g pure-prompt
npm install -g serve
npm install -g stylelint_d

# zsh

ln -s "$(dirname "$(realpath "$0")")/.zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"

# vim

vim +PlugInstall +qa

# bin
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
curl https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh > ~/bin/bulk
chmod +x ~/bin/bulk
