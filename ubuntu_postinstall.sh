#!/bin/bash

# Nicolas Bonnand

sudo apt-get install -y software-properties-common apt-transport-https

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list 

sudo apt-get -y update

sudo apt-get install -y docker-ce openvswitch-switch plotnetcfg


