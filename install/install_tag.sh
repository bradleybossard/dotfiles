#!/bin/bash

# tag - instantly jump to your ag matches
if [[ $OSTYPE == *"linux"* ]]; then
  # install silver searcher
  sudo apt-get update --fix-missing
  sudo apt-get install --yes silversearcher-ag

  # install go
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  "$DIR/install_go.sh"

  go get -u github.com/aykamko/tag/...
  go install github.com/aykamko/tag
fi

if [[ $OSTYPE == *"darwin"* ]]; then
  brew unlink tag  # unlink default osx tag
  brew tap aykamko/tag-ag
  brew install tag-ag
fi
