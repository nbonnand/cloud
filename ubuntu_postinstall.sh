#!/bin/bash

# Nicolas Bonnand

sudo apt-get install -y software-properties-common apt-transport-https

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo bash -c "echo \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" > /etc/apt/sources.list.d/docker.list"

# give a grace period for package installation

keep_running=6
while [ $keep_running -ne 0 ]
do
	if sudo apt-get install -y docker-ce openvswitch-switch plotnetcfg
	then
        	echo 'yes'
        	keep_running=0
    	else
        	echo 'no'
		keep_running=$(( keep_running - 1 ))
		sudo apt-get -y update
	fi
    	sleep 10
    	echo "postinstall keep_running=$keep_running"
done

echo "done"
