#!/usr/bin/env bash
set -x

VERSION="${1:-20}"

if ! [ -x "$(command -v nvm 2>/dev/null)" ]; then
    PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | /usr/bin/env bash'
fi

if ! [ -x "$(command -v node 2>/dev/null)" ]; then
    source "$HOME/.nvm/nvm.sh"
    nvm install "$VERSION"
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
npm install -g stylelint-config-recommended
npm install -g typescript
npm install -g vercel
