#!/usr/bin/env bash

sudo sh -c "echo master1 > /etc/hostname" ; sudo init 6
sudo sh -c "echo node1 > /etc/hostname" ; sudo init 6
sudo sh -c "echo master2 > /etc/hostname" ; sudo init 6
sudo sh -c "echo node2 > /etc/hostname" ; sudo init 6
sudo sh -c "echo master3 > /etc/hostname" ; sudo init 6
sudo sh -c "echo node3 > /etc/hostname" ; sudo init 6
sudo sh -c "echo jumphost > /etc/hostname" ; sudo init 6
sudo sh -c "echo operations > /etc/hostname" ; sudo init 6
