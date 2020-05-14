#!/bin/bash
pushd .
cd /tmp

VERSION=$(curl https://api.github.com/repos/cli/cli/releases/latest | jq '.name' | sed 's/"//g')
echo $VERSION
VERSION_NO_V=$(echo $VERSION | tr -d v)

FILENAME="gh_${VERSION_NO_V}_linux_amd64.deb"
DOWNLOAD_URL="https://github.com/cli/cli/releases/download/$VERSION/$FILENAME"
echo $DOWNLOAD_URL
sudo curl -L $DOWNLOAD_URL -o $FILENAME

sudo dpkg -i $FILENAME
popd
