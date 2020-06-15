function antigen() {

source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle brew
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle cp
antigen bundle dircycle
antigen bundle dirhistory
antigen bundle docker-compose
antigen bundle docker-machine
antigen bundle emoji
antigen bundle git
antigen bundle gitignore
antigen bundle pip
antigen bundle tmux

# Update to date gitignore plugin
# antigen bundle voronkovich/gitignore.plugin.zsh
# # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Load the theme.
antigen theme robbyrussell
#
# # Tell Antigen that you're done.
antigen apply
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

function ohmyzshell() {

if [[ ! -d $HOME/.oh-my-zsh ]]; then
  # Install Oh My Zsh
  #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # rm $HOME/.zshrc
  # ln -s $HOME/src/dotfiles/.zshrc $HOME/.zshrc
fi

# Path to your oh-my-zsh installation.
# export ZSH=/Users/bradleybossard/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  aws
  brew
  cargo
  colorize
  colored-man-pages
  command-not-found
  common-aliases
  cp
  dircycle
  dirhistory
  docker
  docker-compose
  docker-machine
  emoji
  git
  github
  gitignore
  golang
  history
  kube-ps1
  kubectl
  minikube
  ng
  nmap
  node
  npm
  nvm
  postgres
  ripgrep
  rust
  tmux
  vagrant
  vi-mode
  zsh-navigation-tools
  zsh_reload
)

# Update the command line to include timestamp of when commands start
RPROMPT='[%D{%L:%M:%S %p}]'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

autoload -U compinit && compinit

# Removing plugin, caused zsh startup to hang
# npx

# this link has some info for history archiving, might be useful
# https://blog.codefor.cash/2020/04/19/so-long-and-thanks-for-all-the-zsh/

# Custom plugins
plugins+=(
  zsh-syntax-highlighting
  zsh-better-npm-completion
)

# conda

# Need to figure out how to properly install this
# conda

source $ZSH/oh-my-zsh.sh

if [[ $OSTYPE == *"darwin"* ]]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
  rm -f "$HOME/.zcompdump*"
  compinit
fi
}

ohmyzshell
#antigen

export LANG=en_US.UTF-8
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

setopt noincappendhistory
setopt nosharehistory
setopt appendhistory

_ag() {
  if (( CURRENT == 2 )); then
    # TODO: Update location of ./tags file once I understand how ctags works :)
    compadd $(cut -f 1 ./tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}

compdef _ag ag

# $HOME/.nvm/.nvm.sh
ENVFILES=(
  $HOME/.path
  $HOME/.alias
  $HOME/.work-alias
  $HOME/.fzf.zsh
  /usr/share/autojump/autojump.zsh
  /opt/ros/melodic/setup.zsh)

for FILE in $ENVFILES; do
  [ -f $FILE ] && source $FILE
done;


# Ctrl-n to open a file in vim using fzf
bindkey -s '^n' 'vim $(fzf -m)\n'

# source ROS env if it's been installed
# TODO: Figure out a way to do this that doesn't depend on ROS distro name
ROS_ZSH_SETUP="/opt/ros/melodic/setup.zsh"
# if [ -x "/opt/ros/melodic/setup.zsh" ]; then
if [ -x "$ROS_ZSH_SETUP" ]; then
  source $ROS_ZSH_SETUP
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type "direnv" > /dev/null; then
  eval "$(direnv hook $SHELL)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bradleybossard/miniconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bradleybossard/miniconda2/etc/profile.d/conda.sh" ]; then
        . "/home/bradleybossard/miniconda2/etc/profile.d/conda.sh"
    else
        export PATH="/home/bradleybossard/miniconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
