#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v fnm 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://fnm.vercel.app/install)" -- --skip-shell
fi

fnm install 14
npm install -g diff-so-fancy
