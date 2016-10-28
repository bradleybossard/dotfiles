# Sourcing .bashrc for $WORKON_HOME env variable
source ~/.bashrc
# Follow up, do I need to install pip globally? Or even pylint, pyflakes, etc.
# Maybe they belong in postmkvirtualenv
# https://virtualenvwrapper.readthedocs.io/en/latest/scripts.html#scripts-postmkvirtualenv
#sudo apt-get -y install python-pip

sudo apt-get -y install virtualenv virtualenvwrapper pylint pyflakes
echo $WORKON_HOME
mkdir -p $WORKON_HOME
