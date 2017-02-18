# Sourcing .bashrc for $WORKON_HOME env variable
source ~/.bashrc
# Follow up, do I need to install pip globally? Or even pylint, pyflakes, etc.
# Maybe they belong in postmkvirtualenv
# https://virtualenvwrapper.readthedocs.io/en/latest/scripts.html#scripts-postmkvirtualenv

if [[ $OSTYPE == *"darwin"* ]]; then
  pip3 install virtualenv virtualenvwrapper
  #pip3 install pylint pyflakes cookiecutter
else
  # TODO: Revisit this, test OS... not sure to install pylint, etc globally
  sudo apt-get -y install python-pip virtualenv virtualenvwrapper pylint pyflakes cookiecutter
fi

mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

#sudo pip install cookiecutter --upgrade

# install pyenv
#curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# install pyenv-virtualenv
#git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
