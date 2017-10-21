# Install node and a bunch of tools I like globally

# omnibus installer - now using nvm
#sudo sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'

# install nvm then latest node
sudo apt-get install --yes curl
 if [[ $(ls -a $HOME | grep .nvm | wc -c) -eq 0 ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
cp ./nvm-default-packages $NVM_DIR/default-packages
nvm install node;
nvm use node
nvm debug;

# dependencies for building some node c libraries
sudo apt-get install --yes \
  nodejs \
  pkg-config \
  libcairo2-dev \
  libjpeg8-dev \
  libpango1.0-dev \
  libgif-dev \
  build-essential \
  g++
