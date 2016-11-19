# Script for creating clone commands for all current repos

# To run type:
# ./getuncommitted.sh

pushd .
cd ~/src
for repo in $(ls ~/src); do
  cd $repo;
  #repourl=$(git config --get remote.origin.url)
  pull_status=$(git pull) 
  push_status=$(git push -n) 
  pwd
  echo $pull_status
  echo $push_status
  cd ..
done;
popd
