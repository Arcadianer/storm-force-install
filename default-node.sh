#!/bin/bash
# Admin
sudo su
# Pre-Repo
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
# Add Repos
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository ppa:wireguard/wireguard 
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list 
# Update and Upgrade
apt-get -y update 
# Install wireguard/wireguard
apt-get -y install wireguard 
# Install Docker
apt-get -y install docker-ce docker-ce-cli containerd.io 
# Install Kube-Systems
apt-get -y install kubelet kubeadm kubectl 
apt-mark hold kubelet kubeadm kubectl 
# Done Install
echo "Done Install"
# Create Wireguard keys
umask 377
mkdir /vpn
mkdir /vpn/wg0
cd /vpn/wg0
wg genkey | tee privatekey | wg pubkey > publickey
