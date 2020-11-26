#!/usr/bin/env bash

kubectl apply -f tigera-operator.yml
kubectl apply -f custom-resources.yml
