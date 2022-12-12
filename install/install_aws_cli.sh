#!/bin/bash
pushd .
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install completions
complete -C '/usr/local/bin/aws_completer' aws

popd
