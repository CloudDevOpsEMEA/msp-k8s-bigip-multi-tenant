#!/usr/bin/env bash

CA_CERT_DIR=./ca
REGISTRY_CERT_DIR=./registry
CA_DOMAIN_NAME=udfdemo.org

echo "Generate a Server Certificate for Registry"
openssl genrsa -out ${REGISTRY_CERT_DIR}/registry.key 4096
openssl req -sha512 -new \
    -subj "/C=BE/ST=Mechelen/L=Hever/O=F5/OU=Presales/CN=${CA_DOMAIN_NAME}" \
    -key ${REGISTRY_CERT_DIR}/registry.key \
    -out ${REGISTRY_CERT_DIR}/registry.csr
cat > ${REGISTRY_CERT_DIR}/v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=registry.udfdemo.org
DNS.2=udfdemo.org
DNS.3=udfdemo
DNS.4=registry
EOF
openssl x509 -req -sha512 -days 3650 \
    -extfile ${REGISTRY_CERT_DIR}/v3.ext \
    -CA ${CA_CERT_DIR}/ca.crt \
    -CAkey ${CA_CERT_DIR}/ca.key \
    -CAcreateserial \
    -in ${REGISTRY_CERT_DIR}/registry.csr \
    -out ${REGISTRY_CERT_DIR}/registry.crt
    
openssl x509 -inform PEM -in ${REGISTRY_CERT_DIR}/registry.crt -out ${REGISTRY_CERT_DIR}/registry.cert



