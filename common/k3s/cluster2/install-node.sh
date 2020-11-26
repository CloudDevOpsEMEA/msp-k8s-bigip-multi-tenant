#!/usr/bin/env bash

K3S_VERSION=v1.18.12+k3s1
MASTER_DNS=master2
CLUSTER_CIDR=192.168.2.0/24

function printhelp {
  echo "Usage: install-k3s-slave.sh <master_token>"
  echo "    <master_token> K3S master token needed to join the cluster"
  exit 1
}

# Check if necessary input params are set
if [[ -z "${1}" ]]; then
  printhelp
else
  # Increase readability of the rest of the script
  K3S_TOKEN=${1}
fi

K3S_URL="https://${MASTER_DNS}:6443"

echo "Install kubelet and join master node"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=${K3S_VERSION} K3S_URL=${K3S_URL} K3S_TOKEN=${K3S_TOKEN}  K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-backend=none --cluster-cidr=${CLUSTER_CIDR} --disable-network-policy --disable=traefik" sh -

echo "Make kubectl config available for user and enable auto-complete"
sudo mkdir -p ~/.kube
sudo touch ~/.kube/config
sudo chown ubuntu:ubuntu -R ~/.kube

echo '' >>~/.bashrc
echo '# Kubernetes' >>~/.bashrc
echo 'export KUBECONFIG=/home/ubuntu/.kube/config' >>~/.bashrc
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

echo "copy the content of /etc/rancher/k3s/k3s.yaml on the master node into ~/.kube/config to enable kubectl access"