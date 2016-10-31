curl -sSO https://repo.stackdriver.com/stack-install.sh
sudo bash stack-install.sh --write-gcm

curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh

rm install-logging-agent.sh
rm stack-install.sh

pushd .
cd /etc/nginx/conf.d/
sudo curl -O https://raw.githubusercontent.com/Stackdriver/stackdriver-agent-service-configs/master/etc/nginx/conf.d/status.conf
popd
sudo service nginx restart

pushd .
cd /opt/stackdriver/collectd/etc/collectd.d/;
sudo curl -O https://raw.githubusercontent.com/Stackdriver/stackdriver-agent-service-configs/master/etc/collectd.d/nginx.conf
popd
sudo service stackdriver-agent restart

