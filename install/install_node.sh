# Install node and a bunch of tools I like globally

# omnibus installer - now using nvm
#sudo sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'

# install nvm then latest node
sudo apt-get install --yes curl
 if [[ $(ls -a $HOME | grep .nvm | wc -c) -eq 0 ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm install node; nvm use node
  nvm debug;
fi

# dependencies for building some node c libraries
sudo apt-get install -y nodejs pkg-config libcairo2-dev \
libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++

# problematic packages to revist
# angular-cli

packages="avn avn-nvm avn-n "   # Automatic version switching for node
packages+="babelify browserify bower caniuse-cmd express-generator "
packages+="generator-angular-fullstack grunt gulp gulp-cli  jspm "
packages+="live-server node-gyp nodemon protractor quget create-react-app "
packages+="st svgo typescript typings watchify webpack webpack-cli "
packages+="webpack-dev-server wintersmith yarn yo"

for package in $packages; do
  echo $package
  npm install -g $package
  if [ $? -eq 1 ]
  then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "${RED}Problem installing package:${GREEN} $package${NC}\n"
    exit
  fi
done

# avn setup step
avn setup
