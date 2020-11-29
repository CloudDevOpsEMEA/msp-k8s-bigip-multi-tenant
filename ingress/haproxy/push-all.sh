#!/usr/bin/env bash

HAPROXY_VERSIONS=(
  1.0.0
  1.0.1
  1.0.2
  1.0.3
  1.1.0
  1.1.1
  1.1.2
  1.1.3
  1.1.4
  1.1.5
  1.1.6
  1.1.7
  1.2.0
  1.2.1
  1.2.2
  1.2.3
  1.2.4
  1.2.5
  1.2.6
  1.2.7
  1.3.0
  1.3.1
  1.3.2
  1.3.3
  1.4.0
  1.4.1
  1.4.2
  1.4.3
  1.4.4
  1.4.5
  1.4.6
  1.4.7
  1.4.8
  1.4.9
  1.4.10
)

for HAPROXY_VERSION in ${HAPROXY_VERSIONS[@]}; do
  make HAPROXY_VERSION=${HAPROXY_VERSION} haproxy
done
