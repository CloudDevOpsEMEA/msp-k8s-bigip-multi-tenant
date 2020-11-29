#!/usr/bin/env bash

sudo cp ./network/2nic /etc/netplan/50-cloud-init.yaml
sudo netplan apply
