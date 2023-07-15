#!/usr/bin/env bash

# choose .deb package
gh install TheAssassin/AppImageLauncher

# AppImages require FUSE to run
sudo add-apt-repository --yes universe
sudo apt install --yes libfuse2
