#/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"$DIR/install_go.sh"

# hub - win at github
go get github.com/github/hub
