#!/usr/bin/env bash

ssh-keygen -b 2048 -t rsa -q -N ""

tee -a ~/.ssh/config << END
Host *
    StrictHostKeyChecking no
END

sudo chmod 400 ~/.ssh/config

ssh-copy-id ubuntu:ubuntu@master1
ssh-copy-id ubuntu:ubuntu@node1
ssh-copy-id ubuntu:ubuntu@master2
ssh-copy-id ubuntu:ubuntu@node2
ssh-copy-id ubuntu:ubuntu@master3
ssh-copy-id ubuntu:ubuntu@node3
ssh-copy-id ubuntu:ubuntu@jumphost
ssh-copy-id ubuntu:ubuntu@operations
