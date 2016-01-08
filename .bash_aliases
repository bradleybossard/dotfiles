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

alias pythonhttp='python -m SimpleHTTPServer'
alias rebash='source ~/.bashrc'
#alias slack='cd ~/gitsrc/dotfiles; python slack.py; cd -'
alias hisgrep='history | grep $0'

# Aliases
alias tls='tmux list-session'
alias tsw='tmux switch -t '
alias tlc='tmux list-command'
alias tat='tmux attach -dt'
alias tks='tmux kill-session -t'
# Attach to first session
alias tat1='tat $(tls | head -1 | cut -d: -f1)'

alias ports='netstat -tulanp'

# TIP: To have a ' inside alias, replace it with '"'"'
alias dockermem='for line in `docker ps | awk '"'"'{print $1}'"'"' | grep -v CONTAINER`; do docker ps | grep $line | awk '"'"'{printf $NF" "}'"'"' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done'
alias dockerstop='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'
alias dockername='cat /proc/self/cgroup | grep "docker" | sed "s/^.*\///" | tail -n1'
alias dockershort='docker ps --format "table {{.Names}}:\t{{.Image}}\t{{.Ports}}"'

alias sass="docker run -it --rm -v \$(pwd):\$(pwd) -w \$(pwd) jbergknoff/sass"

# Pretty print and colorize json files.
alias pp='python -mjson.tool | pygmentize -l js'

# Shutdown DO machine
alias poweroff="sudo poweroff"



GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
fi

