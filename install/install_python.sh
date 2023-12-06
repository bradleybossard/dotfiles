#!/usr/bin/env bash

sudo apt-get install --yes software-properties-common
sudo add-apt-repository --yes ppa:deadsnakes/ppa
sudo apt-get update

# use python 3.10 for mojo, otherwise latest python (i.e. 3.12)
sudo apt-get install --yes python3.10 python3.10-venv
