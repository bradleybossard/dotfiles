#!/bin/bash
set -euo pipefail
# install nvm then latest node
if [ $(ls -a "$HOME" | grep .nvm | wc -c) -eq 0 ]; then
  LATEST_VERSION=$(curl https://api.github.com/repos/creationix/nvm/releases/latest | jq '.name' | sed 's/"//g')
  curl -o- https://raw.githubusercontent.com/creationix/nvm/$LATEST_VERSION/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
# shellcheck source=~/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
cp ./nvm-default-packages "$NVM_DIR/default-packages"
# nvm install node;
nvm install v8.11.3;
# nvm use node
nvm alias default v8.11.3
nvm debug;

exit

# dependencies for building some node c libraries
# make this dependent on os==linux

if [[ $OSTYPE == *"linux"* ]]; then
  sudo apt-get install --yes \
    nodejs \
    pkg-config \
    libcairo2-dev \
    libjpeg8-dev \
    libpango1.0-dev \
    libgif-dev \
    build-essential \
    g++
fi
