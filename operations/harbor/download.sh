#!/usr/bin/env bash

HARBOR_VERSION=v2.0.4

echo "Download harbor docker registry tarball"
sudo mkdir /opt/harbor
sudo chown -R ubuntu:ubuntu /opt/harbor
cd  /opt/harbor
wget https://github.com/goharbor/harbor/releases/download/${HARBOR_VERSION}/harbor-online-installer-${HARBOR_VERSION}.tgz
tar xvf harbor-online-installer-${HARBOR_VERSION}.tgz
