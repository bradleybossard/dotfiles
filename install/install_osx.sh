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
  virtualenv \
  virtualenvwrapper \
  wget

# oniguruma \
# pcre \
# openssl \
# xz

brew tap aykamko/tag-ag
brew install tag-ag
