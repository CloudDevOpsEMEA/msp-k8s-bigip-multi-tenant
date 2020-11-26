#!/usr/bin/env bash

echo "Adding Ansible apt repo"
sudo apt-add-repository -y ppa:ansible/ansible

echo "Upgrade packages"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y auto-remove

echo "Install packages"
sudo apt-get install -y grc nmap tree siege httpie tcpdump make git wget ansible
sudo snap install helm --classic
sudo snap install k9s
sudo snap install docker

