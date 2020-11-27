#!/usr/bin/env bash

HARBOR_VERSION=v1.10.6

echo "Download harbor docker registry tarball"
cd /tmp
wget https://github.com/goharbor/harbor/releases/download/${HARBOR_VERSION}/harbor-offline-installer-${HARBOR_VERSION}.tgz
tar xvf harbor-offline-installer-${HARBOR_VERSION}.tgz

echo "Generate a Certificate Authority Certificate"
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=BE/ST=Mechelen/L=Mechelen/O=registry/OU=Personal/CN=registry" \
 -key ca.key \
 -out ca.crt

echo "Generate a Server Certificate"
openssl genrsa -out registry.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=yourdomain.com" \
    -key registry.key \
    -out registry.csr
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=registry
EOF
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in registry.csr \
    -out registry.crt


echo "Provide the Certificates to Harbor and Docker"
sudo cp registry.crt /etc/ssl/certs
sudo cp registry.key /etc/ssl/certs

openssl x509 -inform PEM -in registry.crt -out registry.cert
sudo mkdir -p /var/snap/docker/certs.d/registry:8443/
sudo cp registry.cert /var/snap/docker/certs.d/registry:8443/
sudo cp registry.key /var/snap/docker/certs.d/registry:8443/
sudo cp ca.crt /var/snap/docker/certs.d/registry:8443/
sudo snap restart docker


