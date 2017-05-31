# .bash_profile only loaded on OSX, just load .bashrc instead for consistency
# on both OSX/Linux
if [ -f ~/.bashrc ]; then
  . ~/.bashrc;
fi

# added by Anaconda3 4.3.1 installer
#export PATH="/Users/bradleybossard/anaconda/bin:$PATH"
