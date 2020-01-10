#!/bin/bash

# tag - instantly jump to your ag/rg matches
if [[ $OSTYPE == *"linux"* ]]; then
  go get -u github.com/aykamko/tag/...
  go install github.com/aykamko/tag
fi

if [[ $OSTYPE == *"darwin"* ]]; then
  brew tap aykamko/tag-ag
  brew install tag-ag
fi
