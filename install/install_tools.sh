# Research for securing Ubuntu servers
# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/
# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# https://www.inversoft.com/guides/2016-guide-to-user-data-security

## Youtube Downloader
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sudo apt-get update --fix-missing

sudo apt-get -y remove ack
sudo apt-get -y install \
                  ack-grep \
                  bison \
                  bc \
                  context \
                  cowsay \
                  curl \
                  fail2ban \
                  flex \
                  git \
                  graphicsmagick \
                  grc \
                  haskell-platform \
                  hugo \
                  jq \
                  logwatch \
                  mosh \
                  ncdu \
                  nginx \
                  pandoc \
                  r-base-core \
                  redis-server \
                  shellcheck \
                  silversearcher-ag \
                  tree \
                  tig \
                  tmux \
                  urlview \
                  vifm \
                  vim \
                  virtualenv \
                  wget \
                  xmlstarlet

sudo snap install --classic go

go get -u github.com/aykamko/tag/...
go install github.com/aykamko/tag
