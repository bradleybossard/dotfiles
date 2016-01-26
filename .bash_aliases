# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
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

# TIP: To have a ' inside alias, replace it with '"'"'
# Docker top - Lists all docker containers with top-like stats, mem, cpu, io
alias dockertop='docker stats $(docker ps --format '"'"'{{.Names}}'"'"')'
# Stop and remove all running containers
alias dockerstop='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'
# Short ps listing without container IDS, etc
alias dockerpsshort='docker ps --format "table {{.Names}}:\t{{.Image}}\t{{.Ports}}"'
# Delete all stopped containers
alias dockerrmstopped='docker rm -v `docker ps -a -q -f status=exited`'
# Cleanup dangling containers and stuff not in use.
alias dockercleanup='sh docker-cleanup.sh'

# List docker containers matching a regex expression
function dockergrep {
  for i in $(docker ps -a | grep "$1" | tr -s ' ' | cut -f2 -d" "); do
    echo $i;
  done
}

# List urls set as environment variables.  Useful when running containers with jwilder/nginx-proxy
function dockerurls {
  RED='\033[0;31m'
  YELLOW='\033[1;33m'
  NC='\033[0m' # No Color

  containers=$(docker ps --format '{{.Names}}');
  for container in $containers; do
    #echo $RED$container;
    printf "${YELLOW}${container}${NC}\n"
    docker inspect $container | grep \.com\" | tr -s ' ';
    docker inspect $container | grep -i hostport | head -1;
  done
}

# This alias can be used inside a container to get it's name
alias dockername='cat /proc/self/cgroup | grep "docker" | sed "s/^.*\///" | tail -n1'

