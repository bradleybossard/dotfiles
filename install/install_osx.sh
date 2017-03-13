# install brew
if [[ $(which brew | wc -c) -eq 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew unlink tag  # unlink default osx tag

brew install \
  bash-completion \
  cowsay \
  freetype \
  go \
  fortune \ 
  imagemagick \
  jpeg \
  jq \
  libevent \
  libpng \
  libtiff \
  libtool \
  python3 \
  tag-ag \
  the_silver_searcher \
  tmux \
  tree \
  wget


brew install nvm
nvm install node; nvm use node 
mkdir ~/.nvm

# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d 
brew update
brew install coreutils swig
brew cask install cuda
brew cask info cuda


# oniguruma \
# pcre \
# openssl \
# xz

pip intall virtualenv
pip intall virtualenvwrapper

brew tap aykamko/tag-ag
brew install tag-ag
