#!/usr/bin/env bash

# verify that python3.8-3.10 are installed (./install/install_python.sh)

curl https://get.modular.com | sh - && \
modular auth mut_31464268816d48679960d91ece80f4bc

modular install mojo
