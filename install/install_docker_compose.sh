#!/bin/bash

pushd .

cd /tmp

# GET the latest release using the Github API
VERSION=$(curl https://api.github.com/repos/docker/compose/releases/latest | jq '.name' | sed 's/"//g')
echo $VERSION

sudo curl -L https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# this is needed when using podman instead of docker
systemctl --user start podman.socket

popd

exit
