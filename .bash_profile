# .bash_profile only loaded on OSX, just load .bashrc instead for consistency
# on both OSX/Linux
if [ -f ~/.bashrc ]; then
  . ~/.bashrc;
fi
. "$HOME/.cargo/env"
