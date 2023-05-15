#!/bin/bash
####################################################################################
# List of all containers and see what is up and down
####################################################################################
Containers=$(docker ps -a --format "{{.Names}}")
Checkin=true
StatusContainer=0
CountT=0
CountA=0
CountI=0
#echo "State - Docker Container Name"
for val in $Containers; do
let CountT++
#echo "$val"
done
if [[ -n "$CountT" && "$CountT" -gt 0 ]];
then
    echo "State: UP - Docker container: $CountT"
    echo "Removing all containers and folders generate by clab"
    sudo docker rm -f $(sudo docker ps -a -q)
    sudo rm -rf clab-cenario01
    sudo rm -rf .cenario01.clab.yml.bak
else
    echo "State: DOWN - Docker container $CountT"
    echo "Remove foldes generate by clab"
    sudo rm -rf clab-cenario01
    sudo rm -rf .cenario01.clab.yml.bak
fi

echo "Total: $CountT"
####################################################################################