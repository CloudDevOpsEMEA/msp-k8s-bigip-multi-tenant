#!/usr/bin/env bash

KIC_VERSIONS=(
  v0.3
  v0.4.0
  v0.5.0
  v0.6.0
  v0.7.0
  v0.8.0
  v0.8.1
  v0.9.0
  v1.0.0
  v1.1.0
  v1.1.1
  v1.2.0
  v1.3.0
  v1.3.1
  v1.3.2
  v1.4.0
  v1.4.1
  v1.4.2
  v1.4.3
  v1.4.4
  v1.4.5
  v1.4.6
  v1.5.0
  v1.5.1
  v1.5.2
  v1.5.3
  v1.5.4
  v1.5.5
  v1.5.6
  v1.5.7
  v1.5.8
  v1.6.0
  v1.6.1
  v1.6.2
  v1.6.3
  v1.7.0
  v1.7.1
  v1.7.2
  v1.8.0
  v1.8.1
  v1.9.0
  v1.9.0-nsmready
  v1.9.1        
)

for KIC_VERSION in ${KIC_VERSIONS[@]}; do
  make KIC_VERSION=${KIC_VERSION} nginx-kic nginx-plus-kic
done
