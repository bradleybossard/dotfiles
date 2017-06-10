# Install node and a bunch of tools I like globally

# omnibus installer - now using nvm
#sudo sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'

# install nvm then latest node
sudo apt-get install --yes curl
 if [[ $(ls -a $HOME | grep .nvm | wc -c) -eq 0 ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
cp ./nvm-default-packages $NVM_DIR/default-packages
nvm install node;
nvm use node
nvm debug;

# dependencies for building some node c libraries
sudo apt-get install -y nodejs pkg-config libcairo2-dev \
libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++

# problematic packages to revist
# angular-cli

avn_packages="avn avn-nvm avn-n "   # Automatic version switching for node
packages+=$avn_packages

build_packages="babelify browserify bower grunt gulp gulp-cli jspm live-server "
build_packages+="node-gyp nodemon prettier st svgo typescript typings watchify "
build_packages+="yarn "
packages+=$build_packages

generator_packages="create-react-app express-generator "
generator_packages+="generator-angular-fullstack yo "
packages+=$generator_packages

webpack_packages="webpack webpack-cli webpack-dev-server "
packages+=$webpack_packages

misc_packages="caniuse-cmd svgo wintersmith
packages+=$misc_packages

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
