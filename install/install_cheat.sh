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
  LINUX_ARCH=`dpkg --print-architecture`
  USER_BIN_DIR=/usr/local/bin/

  if [[ $LINUX_ARCH == "amd64" ]]; then
    ARCH=linux-amd64
  fi
  if [[ $LINUX_ARCH == "armhf" ]]; then
    ARCH=linux-arm7
  fi
fi

wget -O  - https://github.com/cheat/cheat/releases/download/$VERSION/cheat-$ARCH.gz | gunzip -c > cheat
chmod 755 cheat
sudo mv cheat $USER_BIN_DIR
popd
mkdir -p ~/.config/cheat
mv cheat_conf.yml ~/.config/cheat/conf.yml
