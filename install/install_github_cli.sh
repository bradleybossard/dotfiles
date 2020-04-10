pushd .
cd /tmp

sudo dpkg --add-architecture amd64
sudo apt-get update


VERSION=$(curl https://api.github.com/repos/cli/cli/releases/latest | jq '.name' | sed 's/"//g')
echo $VERSION
exit


sudo curl -L https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose




# sudo apt install git && sudo dpkg -i gh_*_linux_amd64.deb
popd
