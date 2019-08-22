#!/usr/bin/env bash
set -x

brew update
brew install fzf
brew install hub
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
brew upgrade
