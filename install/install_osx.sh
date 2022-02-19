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

brew install cask alacritty
brew install cask authy
brew install cask ultimaker-cura
brew install cask multipass
brew install cask namechanger
brew install cask openscad
sudo xattr -d com.apple.quarantine /Applications/OpenSCAD.app
brew install cask pgadmin4
brew install cask visual-studio-code

# Untested

# brew install cask aerial
# brew install cask anaconda
# brew install cask android-file-transfer
# brew install cask android-studio
# brew install cask atom
# brew install cask balenaetcher   ## etcher
# brew install cask blackhole
# brew install cask blender
# brew install cask boxer
# brew install cask charles
# brew install cask docker-toolbox
# brew install cask genymotion
# brew install cask google-earth
# brew install cask inkscape
# brew install cask krita
# brew install cask lmms
# brew install cask opentoonz
# brew install cask licecap
# brew install cask pencil
# brew install cask pencil2d-pencil
# brew install cask processing
# brew install cask smallpdf
# brew install cask sourcetrail
# brew install cask unity
# brew install cask vagrant

# brew install cask freecad
# Need the follow to bypass OSX Catalina can't install untrusted app
# sudo xattr -d com.apple.quarantine /Applications/FreeCAD.app

# brew install github/gh/gh  # github cli

# NOTE: Not sure these are valid instructions anymore
# To install virtualbox, you must first attempt to install and fail
# brew install cask virtualbox
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

# install eternal terminal
brew install MisterTea/et/et

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
