#!/usr/bin/env bash
asdf plugin add elixir
asdf plugin add erlang

asdf list all elixir | grep main-otp
# choose from latest main-otp- &&
# asdf install elixir main-otp-XX

# then install corresponding erlang
# asdf list all erlang
# asdf install erlang XX.X

exit

pushd .
cd /tmp
PACKAGE_NAME=erlang-solutions_2.0_all.deb
wget https://packages.erlang-solutions.com/$PACKAGE_NAME
sudo dpkg -i $PACKAGE_NAME
sudo apt-get update
sudo apt-get install --yes esl-erlang
sudo apt-get install --yes elixir
popd
