#!/bin/bash
pushd .
cd /tmp
curl https://clickhouse.com/ | sh
sudo ./clickhouse install
sudo clickhouse start
popd
