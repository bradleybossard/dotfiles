#/bin/sh
if [[ $OSTYPE == *"linux"* ]]; then
  sudo snap install --classic go
fi

if [[ $OSTYPE == *"linux"* ]]; then
  brew install go
fi
