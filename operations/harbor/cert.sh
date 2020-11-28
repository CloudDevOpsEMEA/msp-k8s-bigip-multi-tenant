#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
HARBOR_CERT_DIR=../../certificates/harbor

echo "Provide the Certificates to Harbor and Docker"
sudo cp ${HARBOR_CERT_DIR}/harbor.crt /home/ubuntu/harbor/certs
sudo cp ${HARBOR_CERT_DIR}/harbor.key /home/ubuntu/harbor/certs

sudo mkdir -p /var/snap/docker/certs.d/harbor:8443/
sudo cp ${HARBOR_CERT_DIR}/harbor.cert /var/snap/docker/certs.d/harbor:8443/
sudo cp ${HARBOR_CERT_DIR}/harbor.key /var/snap/docker/certs.d/harbor:8443/
sudo cp ${CA_CERT_DIR}/ca.crt /var/snap/docker/certs.d/harbor:8443/
sudo snap restart docker
