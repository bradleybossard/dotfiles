#!/bin/bash

curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
sudo apt-get update
sudo apt-get install --yes albert
