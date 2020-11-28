#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
HARBOR_CERT_DIR=../../certificates/harbor
SNAP_DOCKER_CERT_DIR=/var/snap/docker/certs.d
SNAP_DOCKER_CERT_SUB_DIRS=(
  10.1.1.12:8443
  10.1.10.12:8443
  10.1.20.12:8443
  10.1.30.12:8443
  10.1.40.12:8443
  harbor.udfdemo.org:8443
  harbor:8443
  localhost:8443
)

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

for SNAP_DOCKER_CERT_SUB_DIR in ${SNAP_DOCKER_CERT_SUB_DIRS[@]}; do
  sudo mkdir -p ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SUB_DIR}
  sudo cp ${HARBOR_CERT_DIR}/harbor.cert ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SUB_DIR}/client.cert
  sudo cp ${HARBOR_CERT_DIR}/harbor.key ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SUB_DIR}/client.key
  sudo cp ${CA_CERT_DIR}/ca.crt ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SUB_DIR}/ca.crt
done

sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.udfdemo.org:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/udfdemo.org:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor:8443.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.udfdemo.org.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/udfdemo.org.crt
sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/harbor.crt
sudo update-ca-certificates
