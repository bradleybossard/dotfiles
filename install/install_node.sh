#!/bin/bash
# set -euo pipefail

sudo snap install node --channel=12/stable --classic
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"
npm install -g git+https://github.com/ramitos/jsctags.git
