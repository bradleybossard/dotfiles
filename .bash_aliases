# Aliases
alias tnews='tnew_session'
alias tls='tmux list-session'
#alias tlw='tmux list-window'
alias tsw='tmux switch -t '
alias tlc='tmux list-command'
alias tat='tmux attach -t'
#alias trs='tmux rename-session -t'
alias tka="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"


# Killing
alias tks='tmux kill-session -t'
