#!/usr/bin/env bash

sudo tee -a /etc/hosts << END

# Host aliases for the UDF systems
10.1.1.4    bigip
10.1.1.5    master1
10.1.1.6    node1
10.1.1.7    master2
10.1.1.8    node2
10.1.1.9    master3
10.1.1.10   node3
10.1.1.11   jumphost
END
