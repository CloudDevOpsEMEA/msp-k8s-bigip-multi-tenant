#!/usr/bin/env bash

CA_CERT_DIR=./ca
HARBOR_CERT_DIR=./harbor
CA_DOMAIN_NAME=udfdemo.org

echo "Generate a Server Certificate for harbor"
openssl genrsa -out ${HARBOR_CERT_DIR}/harbor.key 4096
openssl req -sha512 -new \
    -subj "/C=BE/ST=Mechelen/L=Hever/O=F5/OU=Presales/CN=${CA_DOMAIN_NAME}" \
    -key ${HARBOR_CERT_DIR}/harbor.key \
    -out ${HARBOR_CERT_DIR}/harbor.csr
cat > ${HARBOR_CERT_DIR}/harbor-v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=harbor.udfdemo.org
DNS.2=udfdemo.org
DNS.3=udfdemo
DNS.4=harbor
DNS.5=10.1.1.12
DNS.6=10.1.10.12
DNS.7=10.1.20.12
DNS.9=10.1.30.12
DNS.9=10.1.40.12
EOF
openssl x509 -req -sha512 -days 3650 \
    -extfile ${HARBOR_CERT_DIR}/harbor-v3.ext \
    -CA ${CA_CERT_DIR}/ca.crt \
    -CAkey ${CA_CERT_DIR}/ca.key \
    -CAcreateserial \
    -in ${HARBOR_CERT_DIR}/harbor.csr \
    -out ${HARBOR_CERT_DIR}/harbor.crt
    
openssl x509 -inform PEM -in ${HARBOR_CERT_DIR}/harbor.crt -out ${HARBOR_CERT_DIR}/harbor.cert



