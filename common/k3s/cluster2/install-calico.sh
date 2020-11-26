#!/usr/bin/env bash

kubectl create -f tigera-operator.yml
kubectl create -f custom-resources.yml
