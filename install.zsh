#!/usr/bin/env zsh

# dotfiles

for file in $(ls -d src/.*); do
	ln -s "$PWD/$file" "$HOME/$(basename "$file")"
done

# bin

curl --create-dirs -o "$HOME/.config/bulk/bulk.sh" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh
curl --create-dirs -o "$HOME/.config/up/up.sh" https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

# homebrew

if ! [[ -x "$(command -v brew 2>/dev/null)" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

# node

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"

nvm install lts/*
nvm alias default lts/*

npm install -g diff-so-fancy
npm install -g editorconfig
npm install -g npm-check-updates
npm install -g npmrc
npm install -g pure-prompt
npm install -g run-headless
npm install -g say-repl
npm install -g serve
npm install -g stylelint
npm install -g vmd

# vim

curl --create-dirs -o ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa
