#!/bin/bash
# Research for securing Ubuntu servers
# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/
# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# https://www.inversoft.com/guides/2016-guide-to-user-data-security
# BASH strict mode - http://redsymbol.net/articles/unofficial-bash-strict-mode/


if [[ $OSTYPE == *"linux"* ]]; then
  ## Youtube Downloader
  sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl

  sudo apt-get update --fix-missing

  sudo apt-get --yes install \
                    bc \
                    context \
                    direnv \
                    fail2ban \
                    graphicsmagick \
                    grc \
                    htop \
                    inotify-tools \
                    logwatch \
                    lynx \
                    sendmail \
                    mosh \
                    ncdu \
                    ncftp \
                    nnn \
                    shellcheck

  # bison \
  # cowsay \
  # flex \
  # hugo \
  # nginx \
  # pandoc \
  # redis-server \
  # rig \          # random identify generator
  # urlview \
  # virtualenv \
  # xmlstarlet
  # vifm \
fi
