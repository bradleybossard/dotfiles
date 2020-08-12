#!/bin/bash
cd ~/src/dotfiles
pushd .
cd /tmp

VERSION=3.10.1

if [[ $OSTYPE == *"darwin"* ]]; then
  ARCH=darwin-amd64
  USER_BIN_DIR=/usr/local/bin/
fi

if [[ $OSTYPE == *"linux"* ]]; then
  ARCH=linux-amd64
  USER_BIN_DIR=/usr/local/bin/
fi

wget -O  - https://github.com/cheat/cheat/releases/download/$VERSION/cheat-$ARCH.gz | gunzip -c > cheat
chmod 755 cheat
sudo mv cheat $USER_BIN_DIR
popd
mkdir -p ~/.config/cheat
mv cheat_conf.yml ~/.config/cheat/conf.yml
