#!/bin/bash
if [[ $OSTYPE == *"linux"* ]]; then
  sudo apt-get install --yes postgresql postgresql-client postgresql-client-common

  echo "Upon successful installation, create a user and database with the following commands:"
  echo "sudo -u postgres createuser <user>"
  echo "sudo -u postgres createdb -O <user> dbname"
fi
