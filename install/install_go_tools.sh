#!/bin/bash
go get github.com/Rican7/define            # CLI dictionary written in go
go get github.com/github/hub               # hub - win at github
go get -u github.com/tomnomnom/gron        # gron - flatten json
go get -u github.com/maxzender/jv          # jv - interactive json viewer
go get github.com/cortesi/devd/cmd/devd    # development web server
go get github.com/cortesi/modd/cmd/modd    # filesystem watcher

# install dep - go package management
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
