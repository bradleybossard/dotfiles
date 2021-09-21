#!/bin/bash

# Generic example of how to download and install a latest release from Github
pushd .
cd /tmp

ORG=cli
REPO=cli
RELEASES_URL="https://api.github.com/repos/$ORG/$REPO/releases/latest"

echo $RELEASES_URL
DOWNLOAD_URL=`curl -s $RELEASES_URL \
  | grep browser_download_url \
  | grep linux_amd64\.deb \
  | cut -d '"' -f 4`
echo $DOWNLOAD_URL

FILENAME=`basename $DOWNLOAD_URL`

sudo curl -L $DOWNLOAD_URL -o $FILENAME

sudo dpkg -i $FILENAME
popd
