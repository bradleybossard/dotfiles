mkdir ~/src ~/test ~/work

# install homebrew
cd /tmp
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add homebrew to zsh
echo >> /Users/bradleybossard/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/bradleybossard/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install git
brew install \
  antigravity \
  awscli \
  brave-browser \
  bruno \
  docker-desktop \
  fzf \
  gh \
  ghostty \
  git \
  gpg \
  hasura-cli \
  jq \
  mise \
  nvim \
  proj \
  rectangle \
  slack \
  tmux \
  visual-studio-code \
  zplug


exit

brew install \
  obs \
  openshot-video-editor
