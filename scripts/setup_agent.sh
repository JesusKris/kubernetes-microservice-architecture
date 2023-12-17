#!/bin/bash

# Read the master private network IP from the argument
MASTER_PRIVATE_NET_IP=$1
AGENT_PRIVATE_NET_IP=$2
TOKEN=$(cat /vagrant_shared/node-token)

sudo apt-get update 

sudo apt-get install -y curl

sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://"$MASTER_PRIVATE_NET_IP":6443 --prefer-bundled-bin --token "$TOKEN" --node-ip "$AGENT_PRIVATE_NET_IP" --flannel-iface=enp0s8" sh -s -