#!/bin/bash

# Nicolas Bonnand



sudo apt-get install -y software-properties-common apt-transport-https
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# gives add-apt-repository a grace period

keep_running=60
while [ $keep_running -ne 0 ]
do
    if grep -q docker /etc/apt/sources.list
    then
        echo 'yes'
        keep_running=0
    else
        echo 'no'
	keep_running=$(( keep_running - 1 ))
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"	
    fi
    sleep 1
    echo "postinstall keep_running=$keep_running"
done

sudo apt-get -y update
sudo apt-get install -y docker-ce openvswitch-switch plotnetcfg


