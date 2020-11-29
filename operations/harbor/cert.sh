#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
HARBOR_CERT_DIR=../../certificates/harbor
SNAP_DOCKER_CERT_DIR=/etc/docker/certs.d
SNAP_DOCKER_CERT_SANS=(
  localhost:8443
  harbor.udfdemo.org:8443
  udfdemo.org:8443
  harbor:8443
  10.1.1.12:8443
  10.1.10.12:8443
  10.1.20.12:8443
  10.1.30.12:8443
  10.1.40.12:8443
)

echo "Provide the Certificates to Harbor"
mkdir -p /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.crt /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.key /home/ubuntu/harbor/certs

echo "Provide the Certificates to Docker"
for SNAP_DOCKER_CERT_SAN in ${SNAP_DOCKER_CERT_SANS[@]}; do
  sudo mkdir -p ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SAN}
  sudo cp ${HARBOR_CERT_DIR}/harbor.cert ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SAN}/client.cert
  sudo cp ${HARBOR_CERT_DIR}/harbor.key ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SAN}/client.key
  sudo cp ${CA_CERT_DIR}/ca.crt ${SNAP_DOCKER_CERT_DIR}/${SNAP_DOCKER_CERT_SAN}/ca.crt
done

echo "Install CA on Host System"
for SNAP_DOCKER_CERT_SAN in ${SNAP_DOCKER_CERT_SANS[@]}; do
  sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/${SNAP_DOCKER_CERT_SAN}.crt
done
sudo update-ca-certificates
