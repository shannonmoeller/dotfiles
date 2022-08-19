#!/usr/bin/env bash
set -x

VERSION="${1:-16}"

if ! [ -x "$(command -v fnm 2>/dev/null)" ]; then
    curl -fsSL https://fnm.vercel.app/install | /usr/bin/env bash -s -- --force-install --skip-shell
fi

if ! [ -x "$(command -v npm 2>/dev/null)" ]; then
    eval "$("$HOME/.fnm/fnm" env)"
    "$HOME/.fnm/fnm" install "$VERSION"
    "$HOME/.fnm/fnm" default "$VERSION"
    "$HOME/.fnm/fnm" use "$VERSION"
fi

npm install -g diff-so-fancy
npm install -g eslint
npm install -g eslint_d
npm install -g eslint-config-prettier
npm install -g livery
npm install -g npm-check-updates
npm install -g npmrc
npm install -g prettier
npm install -g prettier_d_slim
npm install -g stylelint
npm install -g stylelint_d
npm install -g stylelint-config-prettier
npm install -g stylelint-config-recommended
npm install -g vercel
