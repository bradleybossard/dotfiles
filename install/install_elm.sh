# https://github.com/elm/compiler/blob/master/installers/linux/README.md

cd /tmp
# check the readme to see if this is the latest version
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo mv elm /usr/local/bin/
elm --help
