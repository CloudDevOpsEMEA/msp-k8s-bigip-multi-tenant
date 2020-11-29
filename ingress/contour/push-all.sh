#!/usr/bin/env bash

CONTOUR_VERSIONS=(
  v0.1.0
  v0.10.0
  v0.11.0
  v0.12.0
  v0.12.1
  v0.13.0
  v0.14.0
  v0.14.1
  v0.14.2
  v0.15.0
  v0.15.1
  v0.15.2
  v0.15.3
  v0.2.0
  v0.2.1
  v0.3.0
  v0.3.1
  v0.4.0
  v0.4.1
  v0.5.0
  v0.6.0
  v0.6.1
  v0.7.0
  v0.8.0
  v0.8.1
  v0.9.0
  v1.0.0
  v1.0.1
  v1.1.0
  v1.2.0
  v1.2.1
  v1.3.0
  v1.4.0
  v1.5.0
  v1.5.1
  v1.6.0
  v1.6.1
  v1.7.0
  v1.8.0
  v1.8.1
  v1.8.2
  v1.9.0
  v1.10.0
)

for CONTOUR_VERSION in ${CONTOUR_VERSIONS[@]}; do
  make CONTOUR_VERSION=${CONTOUR_VERSION} contour
done
