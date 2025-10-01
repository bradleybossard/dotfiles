#!/usr/bin/env bash

wget -O /tmp/code_latest_amd64.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo dpkg -i /tmp/code_latest_amd64.deb   
