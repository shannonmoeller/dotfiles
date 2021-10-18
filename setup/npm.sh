#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v fnm 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://fnm.vercel.app/install)" -- --skip-shell
fi

fnm install 16
fnm use 16
npm install -g diff-so-fancy
npm install -g eslint
npm install -g npm-check-updates
npm install -g prettier
npm install -g stylelint
npm install -g stylelint-config-recommended
