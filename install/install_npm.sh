#!/bin/bash
set -euo pipefail

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

testing_packages="dredd "
packages+=$testing_packages

misc_packages="caniuse-cmd svgo wintersmith "
packages+=$misc_packages

for package in $packages; do
  YELLOW='\033[0;33m'
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NO_COLOR='\033[0m'
  printf "${YELLOW}%s ${NO_COLOR}\n" "$package"
  npm install -g "$package"
  if [ $? -eq 1 ]
  then
    printf "${RED}Problem installing package:${GREEN}%s${NO_COLOR}\n" "$package"
    exit
  fi
done

# avn setup step
avn setup
