#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v brew 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

if [ "$(uname)" == Darwin ]; then
    brew install cmake
    brew install coreutils
    brew install fzf
    brew install hub
    brew install macvim
    brew install reattach-to-user-namespace
    brew install the_silver_searcher
    brew install tmux
    brew install tree
fi

if [ "$(uname)" == Linux ]; then
    brew install fzf
    brew install hub
fi

brew upgrade
