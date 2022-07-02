#!/bin/bash
cd tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxf install-tl-unx.tar.gz
cd install-tl-unx
sudo ./install-tl
# TODO: More research to initial non-interactive install
# https://www.tug.org/texlive/doc/install-tl.html
cd -

echo "After installing, to use TexStudio, the following must be configured"
echo "Go to Options -> Configure -> Build, then click "Advanced Options and "
echo "put the texLive install path, i.e. "
echo ""
echo "/usr/local/texlive/2022/bin/x86_64-linux"
echo ""
echo "in the Commands field"


