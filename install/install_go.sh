#!/bin/bash
if [[ $OSTYPE == *"linux"* ]]; then
  sudo snap install --classic go
fi

if [[ $OSTYPE == *"darwin"* ]]; then
  brew install go
fi
