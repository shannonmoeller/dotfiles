#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v zplug 2>/dev/null)" ]; then
    /usr/bin/env zsh -c "$(curl -fsSL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh)"
fi
