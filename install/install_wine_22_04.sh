sudo dpkg --add-architecture i386 

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo mv winehq-jammy.sources /etc/apt/sources.list.d/
sudo apt update
sudo apt install --install-recommends --yes winehq-staging

# at the time, there were no stable builds for wine 7.0, but ideally the following
# line is a better choice
# sudo apt install --install-recommends --yes winehq-stable

