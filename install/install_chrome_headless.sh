# Update app-get
sudo apt-get update --fix-missing

sudo apt-get install --yes chromium-browser

# Test
chromium-browser --headless --dump-dom https://www.chromestatus.com/

# Blog post writeup
# https://developers.google.com/web/updates/2017/04/headless-chrome
