# some more ls aliases

alias ll='ls -alFG'
alias lsd='ls -ld */'  # List just directories
alias la='ls -A'
alias l='ls -lF --group-directories-first'
alias mkdir='mkdir -vp'
alias cp='cp -v'

# Android compilation commands
alias andrun='./gradlew android:installDebug android:run'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias pythonhttp='python -m SimpleHTTPServer'
alias rebash='source ~/.bashrc'
#alias slack='cd ~/gitsrc/dotfiles; python slack.py; cd -'
alias hisgrep='history | grep $0'

alias ghurl="dirname=${PWD##*/}; printf '\nhttp://bradleybossard.github.io/%s\n\n' $dirname"
alias ghpublish='git checkout -B gh-pages; git merge master; git add -A; git commit -m "Publishing"; git push --set-upstream origin gh-pages; git checkout master;'

alias initbasicweb='cp ~/src/basic-web-project/*.{html,js,css} .'

#venuenext
#alias vnlog="git log --decorate --oneline --since=2.days | awk '{system("git describe " $1 " |tr -d '\''\n'\''");$1="";print}'"


# tmux session name autocomplete
_tat() {
	TMUX_SESSIONS=$(tmux ls -F '#S' | xargs)

	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "$TMUX_SESSIONS" -- $cur) )
}
complete -F _tat tat

# tmux aliases
alias tls='tmux list-session'
alias tsw='tmux switch -t '
alias tlc='tmux list-command'
alias tks='tmux kill-session -t'
alias tkall='for session in $(tmux ls | grep : | cut -d. -f1); do tmux kill-session -t $session; done'
alias tgrep='tmux list-session | grep $0'
alias tnew='tmux -2 new-session -d -s ${PWD##*/}; tmux attach -dt ${PWD##*/}'
alias tat='tmux attach -d -t'
if [ -f /etc/bash_completion.d/tat ]; then
. /etc/bash_completion.d/tat
fi

# Create a tmux session for every repos under ~/src
tnewall() {
	pushd .
	cd ~/src
	for name in $(ls); do
		cd $name
		echo $name
		tmux -2 new-session -d -s $name
		cd -
	done;
	popd
}

alias ports='netstat -tulanp'

alias sass="docker run -it --rm -v \$(pwd):\$(pwd) -w \$(pwd) jbergknoff/sass"

# Pretty print and colorize json files.
alias pp='python -mjson.tool | pygmentize -l js'

# Python simple HTTP server
alias pyhttp='python -m SimpleHTTPServer'

# Shutdown DO machine
alias poweroff="sudo poweroff"

GRC=`which grc`
if [ "$TERM" != dumb ] && [ "$GRC" != "" ]
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

alias dockersecurity='docker run -it --net host --pid host --cap-add audit_control \
    -v /var/lib:/var/lib \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/systemd:/usr/lib/systemd \
    -v /etc:/etc --label docker_bench_security \
    docker/docker-bench-security'


# List docker containers matching a regex expression
function dockergrep {
  for i in $(docker ps -a | grep "$1" | tr -s ' ' | cut -f2 -d" "); do
    echo $i;
  done
}

# List urls/ports environment variables for containers that have them.
# Useful when running containers with jwilder/nginx-proxy
function dockerurls {
  RED='\033[0;31m'
  YELLOW='\033[1;33m'
  NC='\033[0m' # No Color

  containers=$(docker ps --format '{{.Names}}');
  for container in $containers; do
    count=$(docker inspect $container | grep \.com\" | wc -l);
    if [ $count -ne 0 ]; then
      printf "${YELLOW}${container}${NC}\n"
      # Grep urls and filter out LETS_ENCRYPT_EMAIL lines
      docker inspect $container | grep \.com\" | grep -v EMAIL | tr -s ' ';
      docker inspect $container | grep -i hostport | tr -s ' ' | head -1;
    fi
  done
}

# This function iterates over existing containers and determines the max
# value of exposed port numbers
function dockermaxopenport {
  # Array for collecting exposed port numbers
  ports=()
  containers=$(docker ps --format '{{.Names}}');
  # Create array of port numbers
  for container in $containers; do
    ports+=$(echo "$(docker port $container | cut -d: -f2) ")
  done
  # Find max and return max
  max=0
  for n in ${ports[@]} ; do
      ((n > max)) && max=$n
  done
  echo $max
}

# Shortcut for workflow I often use.
# docker run -it --rm -v $PWD:/src -p port:8000 --name <same-as-current-dir> <container-path>
# This function automatically starts the container on the next highest port of the current
# running containers, mounts the current directory and names it the same as the current directory.
function dockerrun {
  # Get highest number port of running containers
  maxport=$(dockermaxopenport)
  # Increment port number
  maxport=$(echo $maxport + 1 | bc)
  # Get current directory name
  dirname=${PWD##*/} 
  # Check if there are atleast 2 arguments
	#if [ $# -lt 2 ]
	if [ $# -lt 1 ]
		then
			echo "Usage: dockerrun <container-path>"
			echo "  ex. dockerrun ubuntu/ubuntu"
		  return
	fi
  # Launch container
  cmd="docker run -it --rm -v $PWD:/src -p $maxport:8080 --name $dirname $1"
  echo $cmd
  $cmd
}

# Shortcut for starting bash shell based on current directory name
function dockerbash {
  dirname=${PWD##*/} 
  cmd="docker exec -it $dirname bash"
  echo $cmd
  $cmd
}

# Shortcut to build a Docker image and named the same as current directory
function dockerbuild {
  dirname=${PWD##*/} 
  cmd="docker build -t $dirname ."
  echo $cmd
  $cmd
}

# This alias can be used inside a container to get it's name
alias dockername='cat /proc/self/cgroup | grep "docker" | sed "s/^.*\///" | tail -n1'

# django aliases
alias djrs='python manage.py runserver 0.0.0.0:8000'
alias djs='python manage.py shell'
alias djt='python manage.py test'
alias djl='python manage.py loaddata'
alias djsu='python manage.py createsuperuser'
alias djmm='python manage.py makemigrations'
alias djm='python manage.py migrate'
alias djme='python manage.py makemigrations --empty'

## nginx shortcuts
alias ngrestart='sudo service nginx restart'

# Replace the placeholder with route to current directory
function ngroute {
  dirname=${PWD##*/} 
  file='/etc/nginx/sites-available/default' 
  route="  location /$dirname {\n    alias ${PWD};\n    autoindex on;\n  }\n\n"
  comment='### INSERT NEW ROUTE HERE'  # Placeholder in nginx config
  sudo bash -c "sed -i 's|$comment|$route$comment|' $file"
  ngrestart
  ngurl
}

function ngproxy {
dirname=${PWD##*/} 
available="/etc/nginx/sites-available/$dirname"
enabled="/etc/nginx/sites-enabled/$dirname"

sudo bash -c "cat >$available <<EOF
server {
	listen 80;
	server_name $dirname.bradleybossard.com;
	location / {
		proxy_pass http://127.0.0.1:3000;
	}
}
EOF"

sudo ln -fs $available $enabled
}

#TODO: Fix this to use FQDN
#alias ngurl="dirname=${PWD##*/}; printf '\nhttp://bradleybossard.com/%s\n\n' $dirname"
#alias ngurl="printf '\nhttp://bradleybossard.com/%s\n\n' ${PWD##*/}"
#alias ngurl="dirname=$(basename `pwd`); printf '\nhttp://bradleybossard.com/%s\n\n' $dirname"
alias ngurl="dirname=`pwd | rev | cut -d/ -f1 | rev`; printf '\nhttp://bradleybossard.com/%s\n\n' $dirname"
#alias ngurl="dirname=$(basename `pwd`); printf '\nhttp://bradleybossard.com/%s\n\n' $dirname"


## git

function gitinitrepo {
	if [ -z "$1" ]
		then
			echo "Usage: $0 <path/to/git/repo>  i.e. https://github.com/username/reponame.git"
			return
	fi

	git init
	git add -A
	git commit -m "Initial commit"
	git remote add origin $1
	git pull origin master
	git push --set-upstream origin master
}

# Set up git subtree for Hugo publishing to Github Pages
function hugoinitpublish {
  theme=$(ls themes | head -1)

  if [ -z "$theme" ]
    then
      echo "No theme detected"
      return
  fi

  giturl=`git remote get-url --push origin`

  # Create a new orphand branch (no commit history) named gh-pages
  git checkout --orphan gh-pages

  # Unstage all files
  git rm --cached $(git ls-files)

  # Grab one file from the master branch so we can make a commit
  git checkout master README.md

  # Add and commit that file
  git add .
  git commit -m "Initial commit on gh-pages branch"

  # Push to remote gh-pages branch
  git push origin gh-pages

  # Return to master branch
  git checkout master

  # Remove the public folder to make room for the gh-pages subtree
  rm -rf public

  # Add the gh-pages branch of the repository. It will look like a folder named public
  git subtree add --prefix=public $giturl gh-pages --squash

  # Pull down the file we just committed. This helps avoid merge conflicts
  git subtree pull --prefix=public $giturl gh-pages

  # Run hugo. Generated site will be placed in public directory (or omit -t ThemeName if you're not using a theme)

  hugo -t $theme

  # Add everything
  git add -A

  # Commit and push to master
  git commit -m "Updating site" && git push origin master

  # Push the public subtree to the gh-pages branch
  git subtree push --prefix=public $giturl gh-pages
}

function hugobuild {
  theme=$(ls themes | head -1)
  hugo -t=$theme
}

function hugopublish {
  giturl=`git remote get-url --push origin`
  git subtree push --prefix=public $giturl gh-pages
}

alias hugoundraftall='for file in $(ls content/post/*.md); do hugo undraft $file; done;'

function slackemoji {
  # Fetch
  wget $1
  filename=`basename $1`
  ext="${filename##*.}"
  filename_noext="${filename%.*}"
  resized_name=$filename_noext-resized.${ext}
  width=`identify -format %[fx:w] $filename`
  height=`identify -format %[fx:h] $filename`
  max=$(( $width > $height ? $width : $height ))
  convert $filename -gravity center -extent ${max}x${max} -resize 120x120 $resized_name
  rm $filename
}
