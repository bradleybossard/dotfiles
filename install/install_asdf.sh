#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs latest

asdf global nodejs latest

exit

# to install python, first install the build dependencies

sudo apt-get install --yes make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev

# then something like the following

asdf plugin add python
asdf list all python | grep 3.9
asdf install python 3.9.14
asdf global python 3.9.14

# also, not sure what something like below does

asdf install python latest
