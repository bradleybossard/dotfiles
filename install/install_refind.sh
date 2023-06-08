#!/usr/bin/env bash

sudo apt-add-repository --yes ppa:rodsmith/refind
sudo apt update
sudo apt install --yes refind

# changing partion label
# > e2label /dev/sda1 ubuntu_2204
