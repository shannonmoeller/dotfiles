#!/usr/bin/env bash
set -x

[ "$(uname)" != Darwin ] && exit

if ! [ -x "$(command -v brew 2>/dev/null)" ]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /usr/bin/env bash
fi

brew update
brew install bat
brew install cmake
brew install coreutils
brew install fd
brew install fzf
brew install hub
brew install macvim
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tmux
brew install tree
# brew upgrade
