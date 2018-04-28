#!/bin/bash
# Script for creating clone commands for all current repos

GLOBIGNORE=".:.."
pushd .
cd ~/src || exit
for repo in ~/src
do
  cd "$repo";
  #repourl=$(git config --get remote.origin.url)
  pull_status=$(git pull) 
  push_status=$(git push -n) 
  pwd
  echo "$pull_status"
  echo "$push_status"
  cd ..
done;
popd
