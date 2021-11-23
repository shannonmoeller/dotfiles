#!/usr/bin/env bash
set -x

VERSION="${1:-16}"

if ! [ -x "$(command -v fnm 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://fnm.vercel.app/install)" -- --skip-shell
fi

if ! [ -x "$(command -v npm 2>/dev/null)" ]; then
    fnm install "$VERSION"
    fnm use "$VERSION"
fi

npm install -g diff-so-fancy
npm install -g eslint
npm install -g livery
npm install -g npm-check-updates
npm install -g npmrc
npm install -g prettier
npm install -g stylelint
npm install -g stylelint-config-recommended
npm install -g vercel
