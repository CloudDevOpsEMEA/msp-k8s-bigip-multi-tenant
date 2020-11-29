#!/usr/bin/env bash

sudo cp ./network/5nic.yml /etc/netplan/50-cloud-init.yaml
sudo netplan apply

