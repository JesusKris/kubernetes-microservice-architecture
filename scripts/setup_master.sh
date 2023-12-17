#!/bin/bash

MASTER_PRIVATE_NET_IP=$1

# Update and install necessary packages
sudo apt-get update

sudo apt-get install -y curl

# Install k3s master
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--advertise-address "$MASTER_PRIVATE_NET_IP" --bind-address="$MASTER_PRIVATE_NET_IP" --node-external-ip "$MASTER_PRIVATE_NET_IP" --flannel-iface=enp0s8 server" K3S_KUBECONFIG_MODE="644" sh - 

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant_shared/node-token

sudo cat /etc/rancher/k3s/k3s.yaml | sed "s/127.0.0.1/$MASTER_PRIVATE_NET_IP/g" > /vagrant/config

