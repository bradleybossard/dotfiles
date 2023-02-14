#!/usr/bin/env bash

pushd .
cd /tmp
git clone https://github.com/felt/tippecanoe.git
cd tippecanoe
make -j
sudo make install
popd
