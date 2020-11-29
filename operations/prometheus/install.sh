#!/usr/bin/env bash

echo "Installing Prometheus"
sudo apt-get install prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager

echo "Installing Grafana"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository -y "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get -y update
sudo apt-get -y install grafana
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server
