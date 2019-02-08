#!/bin/bash
# set -euo pipefail
# install nvm then latest node

# TODO: Issue with fresh Ubuntu... Seems NVM_DIR is already in environment (not sure where/how it's injected)
# and causes nvm install script to fail.  For the time being, just run the following two manually, or use
# Ubuntu snap package.
# sudo snap install node --channel=10/stable --classic
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install --lts

exit

#mkdir -p $HOME/.nvm
if [ $(ls -a "$HOME" | grep .nvm | wc -c) -eq 0 ]; then
  LATEST_VERSION=$(curl --silent https://api.github.com/repos/creationix/nvm/releases/latest | jq '.name' | sed 's/"//g')
  echo "Install latest version of nvm: $LATEST_VERSION"
  #curl -o- https://raw.githubusercontent.com/creationix/nvm/$LATEST_VERSION/install.sh | bash
  #echo "curl -o- https://raw.githubusercontent.com/creationix/nvm/$LATEST_VERSION/install.sh"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
fi
exit

export NVM_DIR="$HOME/.nvm"
# shellcheck source=~/.nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#cp ./nvm-default-packages "$NVM_DIR/default-packages"
nvm install --lts
# nvm use node
#nvm alias default v8.11.3
#nvm debug;
