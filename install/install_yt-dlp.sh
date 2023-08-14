#!/usr/bin/env bash

sudo apt install --yes ffmpeg

gh install yt-dlp/yt-dlp
sudo mv $HOME/.local/bin/yt-dlp /usr/local/bin/yt-dlp


