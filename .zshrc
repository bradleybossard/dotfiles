# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#
# https://apptension.com/blog/2018/08/30/shell-configuration-hack-your-zsh/

export LANG=en_US.UTF-8
export EDITOR='vim'
export AWS_VAULT_BACKEND=file

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


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

setopt noincappendhistory
setopt nosharehistory
setopt appendhistory

if [[ $OSTYPE == *"linux"* ]]; then
  source ~/.zplug/init.zsh
fi

zplug "zsh-users/zsh-history-substring-search"
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# Load plugins
zplug "woefe/wbase.zsh"
# zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/wprompt.zsh}"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "plugins/common-aliases",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh

# zplug romkatv/powerlevel10k, as:theme, depth:1
# zplug "junegunn/fzf", use:"shell/*.zsh"
# zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
# zplug "sharkdp/fd", from:gh-r, as:command, rename-to:fd, use:"*x86_64-unknown-linux-gnu.tar.gz"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug 'wfxr/forgit'

zplug "mattberther/zsh-pyenv"
# zplug "zsh-users/zsh-history-substring-search", defer:3
# zplug load



# Unsure why this one is not working
# zplug "plugins/aws",   from:oh-my-zsh
# zplug "plugins/brew",   from:oh-my-zsh
# zplug "plugins/colorize",   from:oh-my-zsh
# this plugin requires
# go get -u github.com/alecthomas/chroma/cmd/chroma

#zplug "plugins/colored-man-pages",   from:oh-my-zsh
#zplug "plugins/cargo",   from:oh-my-zsh
#zplug "plugins/command-not-found",   from:oh-my-zsh

## alias for cpv, which is rsync... not sure this plugin helpful
#zplug "plugins/cp",   from:oh-my-zsh
#zplug "plugins/docker",   from:oh-my-zsh
#zplug "plugins/docker-compose",   from:oh-my-zsh
#zplug "plugins/docker-machine",   from:oh-my-zsh

#zplug "plugins/git",   from:oh-my-zsh
#zplug "plugins/github",   from:oh-my-zsh
#zplug "plugins/gitignore",   from:oh-my-zsh
## just adds aliases, claims to add completion but doesn't seem to work to me
#zplug "plugins/golang",   from:oh-my-zsh

#zplug "plugins/kube-ps1",   from:oh-my-zsh
#zplug "plugins/kubectl",   from:oh-my-zsh
#zplug "plugins/minikube",   from:oh-my-zsh



  #ng
  #nmap
  #node
  #npm
  #nvm
  #postgres
  #ripgrep
  #rust
  #tmux
  #vagrant

  #zsh-navigation-tools
  #zsh_reload

## suffix aliases
# Markdown files
alias -s md=code

# JSON files
alias -s json=code

# bulk association
alias -s {cs,ts,html}=code

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

_ag() {
  if (( CURRENT == 2 )); then
    # TODO: Update location of ./tags file once I understand how ctags works :)
    compadd $(cut -f 1 ./tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}

compdef _ag ag


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
