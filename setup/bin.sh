#!/usr/bin/env bash
set -x

curl --create-dirs -o "$HOME/bin/bulk" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh
curl --create-dirs -o "$HOME/.config/up/up.sh" https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
