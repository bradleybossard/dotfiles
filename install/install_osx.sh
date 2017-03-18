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
  openssl \
  python \
  python3 \
  tag-ag \
  the_silver_searcher \
  tmux \
  tree \
  wget

# Use curl install of nvm to match Linux install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node; nvm use node 

# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d 
#brew update
#brew install coreutils swig
#brew cask install cuda
#brew cask info cuda


# oniguruma \
# pcre \
# xz

pip intall virtualenv
pip intall virtualenvwrapper

brew tap aykamko/tag-ag
brew install tag-ag
