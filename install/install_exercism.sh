sudo snap install exercism
echo Your user token can be found here
echo https://exercism.io/my/settings
echo To configure the CLI to use your token, use
echo exercism configure --token=YOUR_TOKEN
exit

# to run, . install_exercism.sh
# From the install page
# https://github.com/exercism/cli/releases/tag/v2.3.0
# platform = linux | mac | windows
# arch = 32bit | 64bit

# TODO: Figure out how to get latest tag
version=v3.0.9
platform=linux
arch=64bit
pushd .
cd /tmp
#wget https://github.com/exercism/cli/releases/download/v2.3.0/exercism-linux-64bit.tgz
wget https://github.com/exercism/cli/releases/download/$version/exercism-$platform-$arch.tgz
tar -xzvf exercism-linux-64bit.tgz
mkdir ~/bin
mv exercism ~/bin/

popd

