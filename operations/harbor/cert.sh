#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
HARBOR_CERT_DIR=../../certificates/harbor


echo "Provide the Certificates to Harbor and Docker"
mkdir -p /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.crt /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.key /home/ubuntu/harbor/certs

sudo mkdir -p /var/snap/docker/certs.d/harbor:8443/
sudo cp ${HARBOR_CERT_DIR}/harbor.cert /var/snap/docker/certs.d/harbor:8443/
sudo cp ${HARBOR_CERT_DIR}/harbor.key /var/snap/docker/certs.d/harbor:8443/
sudo cp ${CA_CERT_DIR}/ca.crt /var/snap/docker/certs.d/harbor:8443/
sudo snap set system store-certs.cert1="$(cat ${CA_CERT_DIR}/ca.crt)"
sudo snap restart docker

sudo mkdir -p /var/snap/docker/common/etc/certs.d/harbor:8443
sudo cp ${HARBOR_CERT_DIR}/harbor.cert /var/snap/docker/common/etc/certs.d/harbor:8443
sudo cp ${HARBOR_CERT_DIR}/harbor.key /var/snap/docker/common/etc/certs.d/harbor:8443
sudo cp ${CA_CERT_DIR}/ca.crt /var/snap/docker/common/etc/certs.d/harbor:8443


sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.udfdemo.org:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/udfdemo.org:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.udfdemo.org.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/udfdemo.org.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.crt
sudo update-ca-certificates
