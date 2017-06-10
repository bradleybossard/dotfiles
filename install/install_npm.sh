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

misc_packages="caniuse-cmd svgo wintersmith "
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
