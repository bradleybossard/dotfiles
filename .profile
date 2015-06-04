# Assuming brew is install and we want to use the bins installed by it
# we need to add /usr/local/bin to override the OSX defaults.

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
  export ANDROID_HOME=~/android-sdk
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH

  defaults write com.apple.screencapture location ~/Screenshots
  killall SystemUIServer

  alias sshbb="ssh bradleybossard@bbossard.com"
  alias pwdpb="pwd | pbcopy"
  alias dockershell="bash -c \"clear && DOCKER_HOST=tcp://192.168.99.100:2376 DOCKER_CERT_PATH=/Users/bradleybossard/.docker/machine/machines/dev DOCKER_TLS_VERIFY=1 $SHELL\" "

  source ~/.xsh
fi

source ~/.bashrc


