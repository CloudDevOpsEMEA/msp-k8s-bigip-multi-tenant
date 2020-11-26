#!/usr/bin/env bash

K3S_VERSION=v1.18.12+k3s1
MASTER_DNS=master2
CLUSTER_CIDR=192.168.2.0/24

echo "Install k3s master"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=${K3S_VERSION} K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-backend=none --cluster-cidr=${CLUSTER_CIDR} --disable-network-policy --disable=traefik" sh -
K3S_TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)
K3S_URL="https://${MASTER_DNS}:6443"

echo "Install kubelet and join master node"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=${K3S_VERSION} K3S_URL=${K3S_URL} K3S_TOKEN=${K3S_TOKEN} K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-backend=none --cluster-cidr=${CLUSTER_CIDR} --disable-network-policy --disable=traefik" sh -

echo "Make kubectl config available for user and enable auto-complete"
sudo mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown ubuntu:ubuntu -R ~/.kube
sudo sed -i 's/127.0.0.1/master2/' ~/.kube

echo '' >>~/.bashrc
echo '# Kubernetes' >>~/.bashrc
echo 'export KUBECONFIG=/home/ubuntu/.kube/config' >>~/.bashrc
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
