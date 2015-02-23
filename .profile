# Assuming brew is install and we want to use the bins installed by it
# we need to add /usr/local/bin to override the OSX defaults.
#export PATH=$PATH:/usr/local/bin:/usr/local/opt/ruby/bin
export PATH=/usr/local/bin:/usr/local/opt/ruby/bin:$PATH

defaults write com.apple.screencapture location ~/Screenshots
killall SystemUIServer

export ANDROID_HOME=~/android-sdk

alias pwdpb="pwd | pbcopy"

source ~/.bashrc
