#!/bin/bash
if [[ $OSTYPE == *"linux"* ]]; then
  if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
  fi

  # TODO: Ensure sudo before script runs
  cd /tmp
  FILE=go1.18.3.linux-amd64.tar.gz
  wget "https://go.dev/dl/$FILE"
  rm -rf /usr/local/go && tar -C /usr/local -xzf "$FILE"
  cd -
fi

if [[ $OSTYPE == *"darwin"* ]]; then
  # TODO: Probably good enough, check version when finished.
  # If not, implement instructions as above for official install.
  brew install go
fi
