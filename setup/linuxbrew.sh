#!/usr/bin/env bash
set -x

[ "$(uname)" != Linux ] && exit

if ! [ -x "$(command -v brew 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi

brew update
brew install hub
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
brew upgrade
