# Sourcing .bashrc for $WORKON_HOME env variable
source ~/.bashrc
# Follow up, do I need to install pip globally? Or even pylint, pyflakes, etc.
# Maybe they belong in postmkvirtualenv
# https://virtualenvwrapper.readthedocs.io/en/latest/scripts.html#scripts-postmkvirtualenv
#sudo apt-get -y install python-pip

sudo apt-get -y install virtualenv virtualenvwrapper pylint pyflakes
#mkdir -p $WORKON_HOME
#mkdir -p $PROJECT_HOME

# install pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# install pyenv-virtualenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
