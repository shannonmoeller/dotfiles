#!/usr/bin/env bash
set -x

sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y tmux
sudo apt-get install -y tree
sudo apt-get install -y vim
sudo apt-get install -y zsh
sudo apt-get upgrade -y
sudo apt-get autoremove -y
