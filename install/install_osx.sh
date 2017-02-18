if [[ $(which brew | wc -c) -eq 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew unlink tag  # unlink default osx tag

brew install \
  bash-completion \
  freetype \
  go \
  jq \
  imagemagick \
  jpeg \
  libevent \
  libpng \
  libtiff \
  libtool \
  node \
  python3 \
  tag-ag \
  the_silver_searcher \
  tmux \
  tree \
  wget

# oniguruma \
# pcre \
# openssl \
# xz

pip intall virtualenv
pip intall virtualenvwrapper

brew tap aykamko/tag-ag
brew install tag-ag
