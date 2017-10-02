#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# install brew
if [[ $(which brew | wc -c) -eq 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap caskroom/cask
# TODO: Search caskroom to find more installable apps
# https://caskroom.github.io/search
brew cask install iterm2
brew cask install spectacle
brew cask install pgadmin4
brew cask install namechanger

# Untested
# brew cask install google-chrome
# brew cask install docker-toolbox
# brew cask install anaconda
# brew cask install android-file-transfer
# brew cask install android-studio
# brew cask install atom
# brew cask install blender
# brew cask install boxer
# brew cask install charles
# brew cask install genymotion
# brew cask install google-earth
# brew cask install inkscape
# brew cask install krita
# brew cask install opentoonz
# brew cask install licecap
# brew cask install pencil
# brew cask install pencil2d-pencil
# brew cask install processing
# brew cask install vlc


brew install \
  bash-completion \
  cairo \
  coreutils \
  cowsay \
  ctags \
  fortune \ 
  freetype \
  gifsicle \
  glew \
  glfw3 \
  go \
  hub \
  icdiff \
  imagemagick \
  jpeg \
  jq \
  libevent \
  libpng \
  libtiff \
  libtool \
  ncdu \
  neovim \
  nmap \
  openssl \
  p7zip \
  par2 \
  pow \
  python \
  python3 \
  the_silver_searcher \
  tig \
  tmux \
  tree \
  urlview \
  vim --override-system-vi \
  vifm \
  watch \
  wget

brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r \
                    --with-libass --with-libbluray --with-libcaca --with-speex \
                    --with-libquvi --with-libvidstab --with-libvo-aacenc \
                    --with-libvorbis --with-libvpx --with-opencore-amr \
                    --with-openjpeg --with-openssl --with-opus --with-rtmpdump \
                    --with-schroedinger --with-theora --with-tools --with-x265

# For installing imagemagick 
brew install libpng --build-from-source
brew install -v imagemagick --build-from-source


brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste

# Use curl install of nvm to match Linux install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node;
nvm use node

# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d 
#brew update
#brew install coreutils swig
#brew cask install cuda
#brew cask info cuda

# TODO: Look at best way to install virtualenvwrapper on OSX.  Maybe pip is good enough
# pip install virtualenv
# pip install virtualenvwrapper
# brew install pyenv-virtualenvwrapper \

# Install tag for silversearcher (ag)
brew unlink tag  # unlink default osx tag
brew tap aykamko/tag-ag
brew install tag-ag

# PostGres install
brew install postgresql
brew services start postgresql

# Create default postgres user (requires password)
createuser -d -a -s -P postgres

psql postgres -c 'CREATE EXTENSION "adminpack";'

