#!/usr/bin/env bash
set -x

[ "$(uname)" != Linux ] && exit

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y curl
sudo apt-get install -y mosh
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y tmux
sudo apt-get install -y tree
sudo apt-get install -y unzip
sudo apt-get install -y vim
sudo apt-get install -y xsel
sudo apt-get install -y zsh
sudo apt-get upgrade -y
sudo apt-get autoremove -y
