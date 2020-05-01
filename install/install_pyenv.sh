#!/bin/bash

# Install dependencies
sudo apt-get install --yes make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev

# install pyenv
# curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# install pyenv-virtualenv
PYENV_ROOT=$HOME/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
