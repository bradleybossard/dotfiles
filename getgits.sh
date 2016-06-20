# Script for creating clone commands for all current repos

cd ~/src
for repo in $(ls ~/src); do
  cd $repo;
  repourl=$(git config --get remote.origin.url)
  echo git clone $repourl
  cd ..
done;
