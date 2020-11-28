#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
REGISTRY_CERT_DIR=../../certificates/registry

echo "Provide the Certificates to Harbor and Docker"
sudo cp ${REGISTRY_CERT_DIR}/registry.crt /home/ubuntu/harbor/certs
sudo cp ${REGISTRY_CERT_DIR}/registry.key /home/ubuntu/harbor/certs

sudo mkdir -p /var/snap/docker/certs.d/registry:8443/
sudo cp ${REGISTRY_CERT_DIR}/registry.cert /var/snap/docker/certs.d/registry:8443/
sudo cp ${REGISTRY_CERT_DIR}/registry.key /var/snap/docker/certs.d/registry:8443/
sudo cp ${CA_CERT_DIR}/ca.crt /var/snap/docker/certs.d/registry:8443/
sudo snap restart docker