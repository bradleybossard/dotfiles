#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs latest

asdf global nodejs latest



