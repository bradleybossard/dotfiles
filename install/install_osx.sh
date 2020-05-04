#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ideas for further OSX scripting configuration
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# disable "natural" scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# enable screen lock in bottom-left
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Sets "Allow apps downloaded from:" to "Anywhere"
# Needed for VirtualBox, possibly others
sudo spctl --master-disable

# install brew
if [[ $(which brew | wc -c) -eq 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# install brew essentials
brew install \
  autojump \
  ctags \
  hub \
  git \
  go \
  gron \
  jq \
  ripgrep \
  tig \
  tmux \
  tree \
  urlview \
  vim \
  wget

# install brew casks essentials
brew cask install google-chrome
brew cask install iterm2
brew cask install spectacle
brew cask install vlc

exit

brew cask install alacritty
brew cask install authy
brew cask install ultimaker-cura
brew cask install multipass
brew cask install namechanger
brew cask install openscad
sudo xattr -d com.apple.quarantine /Applications/OpenSCAD.app
brew cask install pgadmin4
brew cask install visual-studio-code

# Untested

# brew cask install aerial
# brew cask install anaconda
# brew cask install android-file-transfer
# brew cask install android-studio
# brew cask install atom
# brew cask install balenaetcher   ## etcher
# brew cask install blackhole
# brew cask install blender
# brew cask install boxer
# brew cask install charles
# brew cask install docker-toolbox
# brew cask install genymotion
# brew cask install google-earth
# brew cask install inkscape
# brew cask install krita
# brew cask install lmms
# brew cask install opentoonz
# brew cask install licecap
# brew cask install pencil
# brew cask install pencil2d-pencil
# brew cask install processing
# brew cask install smallpdf
# brew cask install sourcetrail
# brew cask install unity
# brew cask install vagrant

# brew cask install freecad
# Need the follow to bypass OSX Catalina can't install untrusted app
# sudo xattr -d com.apple.quarantine /Applications/FreeCAD.app

# brew install github/gh/gh  # github cli

# NOTE: Not sure these are valid instructions anymore
# To install virtualbox, you must first attempt to install and fail
# brew cask install virtualbox
# After the install fails, go System Preferences -> Security & Privacy,
# then enable the app install from Oracle
# brew cask reinstall --force virtualbox --verbose --debug

brew install \
  bash-completion \
  cairo \
  coreutils \
  cowsay \
  direnv \
  fortune \ 
  freetype \
  gifsicle \
  glew \
  glfw3 \
  icdiff \
  imagemagick \
  jpeg \
  kubectl \
  kubectx \
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
  peco \
  pow \
  python \
  python3 \
  tig \
  thefuck \
  urlview \
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

# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d 
#brew update
#brew install coreutils swig
#brew cask install cuda
#brew cask info cuda

# TODO: Look at best way to install virtualenvwrapper on OSX.  Maybe pip is good enough
# pip install virtualenv
# pip install virtualenvwrapper
# brew install pyenv-virtualenvwrapper \

# PostGres install
brew install postgresql
brew services start postgresql

# Create default postgres user (requires password)
createuser -d -a -s -P postgres

psql postgres -c 'CREATE EXTENSION "adminpack";'

# Runs App Store update
sudo softwareupdate -i -a


