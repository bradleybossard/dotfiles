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
  cowsay \
  fortune \ 
  freetype \
  go \
  imagemagick \
  jpeg \
  jq \
  libevent \
  libpng \
  libtiff \
  libtool \
  openssl \
  p7zip \
  python \
  python3 \
  the_silver_searcher \
  tig \
  tmux \
  tree \
  urlview \
  vifm \
  wget

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

pip intall virtualenv
pip intall virtualenvwrapper

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
