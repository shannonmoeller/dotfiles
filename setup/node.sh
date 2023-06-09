#!/usr/bin/env bash
set -x

VERSION="${1:-18}"

if ! [ -x "$(command -v nvm 2>/dev/null)" ]; then
    PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | /usr/bin/env bash'
fi

if ! [ -x "$(command -v node 2>/dev/null)" ]; then
    source "$HOME/.nvm/nvm.sh"
    nvm install "$VERSION"
fi

npm install -g \
    diff-so-fancy \
    eslint \
    eslint_d \
    eslint-config-prettier \
    livery \
    npm-check-updates \
    npmrc \
    prettier \
    prettier_d_slim \
    stylelint \
    stylelint_d \
    stylelint-config-recommended \
    vercel