# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# Add timestamps for history commands
HISTTIMEFORMAT="%d/%m/%y %T "
# Create seperate directories for history commands, preserve for all time :P
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"
`mkdir -p $(dirname  $HISTFILE)`

# Save to history files before issuing command
export PROMPT_COMMAND='history -a'


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'
alias l='ls -lF --group-directories-first'

# Android compilation commands
alias andrun='./gradlew android:installDebug android:run'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set PS1='$'

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# for pipsi, next-gen pip tool
export PATH=~/.local/bin:$PATH

alias pythonhttp='python -m SimpleHTTPServer'
alias rebash='source ~/.bashrc'
alias slack='cd ~/gitsrc/dotfiles; python slack.py; cd -'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# TODO(bradleybossard) : These don't seem to work on Digital Ocean virtual box.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias hisgrep='history | grep $0'

function grepcode  {
  grep -RnsI --color=auto $1 *
}


set -o vi
#bindkey -v

export SVN_EDITOR=vim

export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh


source ~/.coolcommands.sh
source ~/.svnlog.sh


# Do some platform specific commands
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
elif [[ "$unamestr" == 'Darwin' ]]; then
  export ANDROID_HOME=~/android-sdk
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH

  defaults write com.apple.screencapture location ~/Screenshots
  killall SystemUIServer

  alias sshbb="ssh bradleybossard@bbossard.com"
  alias pwdpb="pwd | pbcopy"
  alias dockershell="bash -c \"clear && DOCKER_HOST=tcp://192.168.99.100:2376 DOCKER_CERT_PATH=/Users/bradleybossard/.docker/machine/machines/dev DOCKER_TLS_VERIFY=1 $SHELL\" "

  source ~/.xsh
  source ~/.ssh_aliases
elif [[ "$unamestr" == 'CYGWIN_NT-6.1' ]]; then
  export VAGRANT_DETECTED_OS=CYGWIN_NT-6.3
fi


