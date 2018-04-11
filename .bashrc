# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

[ -f ~/.path ] && source ~/.path

[ -f ~/.alias ] && source ~/.alias

[ -f ~/.work-alias ] && source ~/.work-alias

#TODO: Need some debugging here, trying to override system Python 2.7 with Brew Python 3
if [[ $OSTYPE == *"darwin"* ]]; then
  echo 'point'
  alias python="python3"
fi

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

TMUX_SESSION_NAME=""
if { [ "$TMUX" != "" ]; } then
  TMUX_SESSION_NAME=`tmux display-message -p '#S'`
fi
# Create seperate directories for history commands, preserve for all time :P
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${TMUX_SESSION_NAME}_${HOSTNAME}_$$"
`mkdir -p $(dirname  $HISTFILE)`

# Save to history files before issuing command
export PROMPT_COMMAND='history -a'

# python virtualenv and virtualenvwrapper section
export VIRTUALENVWRAPPER_PYTHON=`which python`
if [[ $OSTYPE == *"darwin"* ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
  export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
  source `which virtualenvwrapper.sh`
fi

export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/.virtualenvprojects 

mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

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
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Source aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -d "$HOME"/go ]; then
  HUB_COMPLETION=$(find "$HOME"/go | grep bash_completion.sh)
  if [[ ! -z "$HUB_COMPLETION" ]]; then
    . "$HUB_COMPLETION"
  fi
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

if [[ $OSTYPE == *"darwin"* ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

set PS1='$'

if [ -e ~/.git-completion ]; then
  source ~/.git-completion
fi

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

if [[ $(which ag | wc -c) -ne 0 ]]; then
  # TODO: Not sure of purpose of following if
  if hash ag 1>/dev/null; then
    tag() {
      command tag "$@";
      source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null
    }
    alias ag='tag'
  fi
fi

export DISPLAY=:0.0

# nativescript cli tool completion
if [ -f /Users/bradleybossard/.tnsrc ]; then 
    source /Users/bradleybossard/.tnsrc 
fi

# nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aws cli tool completion
complete -C '`which aws_completer`' aws

[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

# fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# avn automatic version switching for node
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/bradleybossard/.nvm/versions/node/v8.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/bradleybossard/.nvm/versions/node/v8.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/bradleybossard/.nvm/versions/node/v8.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/bradleybossard/.nvm/versions/node/v8.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/bradleybossard/.sdkman"
[[ -s "/home/bradleybossard/.sdkman/bin/sdkman-init.sh" ]] && source "/home/bradleybossard/.sdkman/bin/sdkman-init.sh"

[ -f/usr/share/autojump/autojump.bash ] && . /usr/share/autojump/autojump.bash
