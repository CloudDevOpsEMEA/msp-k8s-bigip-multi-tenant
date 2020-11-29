#!/usr/bin/env bash

CA_CERT_DIR=../../certificates/ca
HARBOR_CERT_DIR=../../certificates/harbor

DOCKER_CERT_DIR=/etc/docker/certs.d
DOCKER_CERT_SANS=(
  localhost
  harbor.udfdemo.org
  udfdemo.org
  harbor
  10.1.1.12
  10.1.10.12
  10.1.20.12
  10.1.30.12
  10.1.40.12
)

echo "Provide the Certificates to Harbor"
mkdir -p /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.crt /home/ubuntu/harbor/certs
cp ${HARBOR_CERT_DIR}/harbor.key /home/ubuntu/harbor/certs

echo "Provide the Certificates to Docker"
for DOCKER_CERT_SAN in ${DOCKER_CERT_SANS[@]}; do
  sudo mkdir -p ${DOCKER_CERT_DIR}/${DOCKER_CERT_SAN}
  sudo cp ${HARBOR_CERT_DIR}/harbor.cert ${DOCKER_CERT_DIR}/${DOCKER_CERT_SAN}/client.cert
  sudo cp ${HARBOR_CERT_DIR}/harbor.key ${DOCKER_CERT_DIR}/${DOCKER_CERT_SAN}/client.key
  sudo cp ${CA_CERT_DIR}/ca.crt ${DOCKER_CERT_DIR}/${DOCKER_CERT_SAN}/ca.crt
done

echo "Install CA on Host System"
for DOCKER_CERT_SAN in ${DOCKER_CERT_SANS[@]}; do
  sudo cp ${CA_CERT_DIR}/ca.crt /usr/local/share/ca-certificates/${DOCKER_CERT_SAN}.crt
done
sudo update-ca-certificates
