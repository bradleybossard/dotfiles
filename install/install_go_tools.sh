#!/bin/bash
go get github.com/Rican7/define            # CLI dictionary written in go
go get -u github.com/tomnomnom/gron        # gron - flatten json
go get -u github.com/maxzender/jv          # jv - interactive json viewer
go get github.com/cortesi/devd/cmd/devd    # development web server
go get github.com/cortesi/modd/cmd/modd    # filesystem watcher
go get github.com/claudiodangelis/qrcp     # qr copy to mobile

GO111MODULE=on go get -v -u github.com/go-critic/go-critic/cmd/gocritic  # code linter
go install github.com/create-go-app/cli/v3/cmd/cgapp@latest  # create go app



# install dep - go package management
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
