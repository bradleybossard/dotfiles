#!/bin/bash

# TODO: try linux command on osx, simplify
exit

# tag - instantly jump to your ag/rg matches
if [[ $OSTYPE == *"linux"* ]]; then
  go install github.com/aykamko/tag@latest
fi

if [[ $OSTYPE == *"darwin"* ]]; then
  brew tap aykamko/tag-ag
  brew install tag-ag
fi
