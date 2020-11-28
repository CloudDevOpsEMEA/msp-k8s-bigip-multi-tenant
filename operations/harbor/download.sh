#!/usr/bin/env bash

HARBOR_VERSION=v2.0.4
INSTALL_DIR=/home/ubuntu/harbor

PWD=$(dirname $(readlink -f $0))

echo "Download harbor docker registry tarball"
wget https://github.com/goharbor/harbor/releases/download/${HARBOR_VERSION}/harbor-online-installer-${HARBOR_VERSION}.tgz
mv harbor-online-installer-${HARBOR_VERSION}.tgz /tmp
cd /tmp
tar xvf harbor-online-installer-${HARBOR_VERSION}.tgz
cd harbor
cp ${PWD}/harbor.yml .
