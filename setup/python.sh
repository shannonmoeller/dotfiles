#!/usr/bin/env bash
set -x

if ! [ -x "$(command -v pyenv 2>/dev/null)" ]; then
  PROFILE=/dev/null bash -c 'curl -o- https://pyenv.run | /usr/bin/env bash'
fi
