# Sourcing .bashrc for $WORKON_HOME env variable
# source ~/.bashrc
# Follow up, do I need to install pip globally? Or even pylint, pyflakes, etc.
# Maybe they belong in postmkvirtualenv
# https://virtualenvwrapper.readthedocs.io/en/latest/scripts.html#scripts-postmkvirtualenv

# TODO: Need to revisit this entire script... Installed virtualenv and virtualenvwrapper may
# work just the same on both Linux and Darwin.

#if [[ $OSTYPE == *"darwin"* ]]; then
#  pip3 install virtualenv virtualenvwrapper flake8
  #pip3 install pylint pyflakes cookiecutter
#else
  # TODO: Revisit this, test OS... not sure to install pylint, etc globally
  #sudo apt-get -y install python-pip virtualenv virtualenvwrapper pylint pyflakes cookiecutter
#fi

# Moved these to .bashrc
#mkdir -p $WORKON_HOME
#mkdir -p $PROJECT_HOME

#sudo pip install cookiecutter --upgrade
