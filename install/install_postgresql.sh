if [[ $OSTYPE == *"linux"* ]]; then
  sudo apt-get install --yes postgresql postgresql-client postgresql-client-common
  # TODO: According to this tutorial, all that is needed is the following, need to verify
  # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
  # sudo apt install postgresql postgresql-contrib
fi
