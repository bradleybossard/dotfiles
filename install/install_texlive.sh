#!/usr/bin/env bash
# after the exit are instructions for installing the latest texlive,
# but i've decided i'm not advanced enough to need the latest yet
sudo apt-get update
sudo apt install --yes texlive-full

exit

pushd .
cd /tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxf install-tl-unx.tar.gz
UNTARRED_DIR=$(find . -type d -name "install-tl-[0-9]*" | head -1)
cd $UNTARRED_DIR
sudo ./install-tl
# TODO: More research to initial non-interactive install
# https://www.tug.org/texlive/doc/install-tl.html
popd

echo 'After installing, to use TexStudio, the following must be configured'
echo 'Go to Options -> Configure -> Build, then click "Advanced Options and '
echo 'put the texLive install path, i.e. '
echo ''
echo 'usr/local/texlive/2022/bin/x86_64-linux'
echo ''
echo 'in the Commands field'

