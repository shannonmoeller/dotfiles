#!/usr/bin/env bash
set -x

mkdir -p "$HOME/bin"
curl -o "$HOME/bin/bulk" https://raw.githubusercontent.com/shannonmoeller/bulk/master/bulk.sh
