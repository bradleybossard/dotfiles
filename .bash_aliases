# Aliases
alias tnews='tnew_session'
alias tls='tmux list-session'
alias tsw='tmux switch -t '
alias tlc='tmux list-command'
alias tat='tmux attach -t'
alias tks='tmux kill-session -t'


alias ports='netstat -tulanp'

# To have a ' inside alias, replace it with '"'"'

alias dockermem='for line in `docker ps | awk '"'"'{print $1}'"'"' | grep -v CONTAINER`; do docker ps | grep $line | awk '"'"'{printf $NF" "}'"'"' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done'
alias dockerstop='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'


alias sass="docker run -it --rm -v \$(pwd):\$(pwd) -w \$(pwd) jbergknoff/sass"

# Pretty print and colorize json files.
alias pp='python -mjson.tool|pygmentize -l js'

# Shutdown DO machine
alias poweroff="sudo poweroff"
