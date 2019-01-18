#!/usr/bin/env bash
set -x

if [[ "$(uname)" == Linux ]]; then
    mkdir ~/.zfunctions
fi

npm install -g diff-so-fancy
npm install -g editorconfig
npm install -g eslint
npm install -g now
npm install -g npm-check-updates
npm install -g prettier
npm install -g pure-prompt
npm install -g run-headless
npm install -g say-repl
npm install -g serve
npm install -g stylelint
npm install -g vmd