#!/usr/bin/env bash

HARBOR_VERSION=v2.0.4
INSTALL_DIR=/home/ubuntu/harbor

HARBOR_YAML=$(dirname $(readlink -f $0))/harbor.yml

echo "Download harbor docker registry tarball"
wget https://github.com/goharbor/harbor/releases/download/${HARBOR_VERSION}/harbor-online-installer-${HARBOR_VERSION}.tgz --directory-prefix=/home/ubuntu
cd /home/ubuntu
tar xvf harbor-online-installer-${HARBOR_VERSION}.tgz
cd harbor
cp ${HARBOR_YAML} .
