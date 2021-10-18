#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v fnm 2>/dev/null)" ]; then
    /usr/bin/env bash -c "$(curl -fsSL https://fnm.vercel.app/install)" -- --skip-shell
fi

VERSION="${1:-16}"

fnm install "$VERSION"
fnm use "$VERSION"
npm install -g diff-so-fancy
npm install -g eslint
npm install -g livery
npm install -g npm-check-updates
npm install -g npmrc
npm install -g prettier
npm install -g stylelint
npm install -g stylelint-config-recommended
npm instlal -g vercel
