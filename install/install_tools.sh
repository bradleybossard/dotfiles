# Research for securing Ubuntu servers
# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/
# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# https://www.inversoft.com/guides/2016-guide-to-user-data-security

user=bradleybossard

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
                  curl \
                  fail2ban \
                  flex \
                  git \
                  golang-go \
                  graphicsmagick \
                  grc \
                  haskell-platform \
                  hugo \
                  jq \
                  logwatch \
                  mosh \
                  nginx \
                  pandoc \
                  r-base-core \
                  silversearcher-ag \
                  tree \
                  tmux \
                  vim \
                  virtualenv \
                  wget \
                  xmlstarlet

go get -u github.com/aykamko/tag/...
go install github.com/aykamko/tag
