#!/bin/bash
#Admin
sudo su
#Pre-Repo
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common	
#Add Repos
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
add-apt-repository ppa:wireguard/wireguard
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
# Update and Upgrade
apt-get -y update 
apt-get -y upgrade
# Install wireguard/wireguard
apt-get -y install wireguard
# Install Docker
apt-get install docker-ce docker-ce-cli containerd.io
# Install Kube-Systems
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
#Done
echo "Done"
