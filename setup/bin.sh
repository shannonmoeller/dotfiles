#!/usr/bin/env zsh

set -ex

# bin

curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
curl https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh > ~/bin/bulk
chmod +x ~/bin/bulk
