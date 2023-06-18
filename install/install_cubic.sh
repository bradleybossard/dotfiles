#!/usr/bin/env bash

sudo apt-add-repository --yes universe
sudo apt-add-repository --yes ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends --yes cubic
