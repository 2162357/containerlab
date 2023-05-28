#!/bin/bash
###############################################################
# Check if there is containers up and running 
# and remove all contianers and folders created by clab
###############################################################
Containers=$(docker ps -a --format "{{.Names}}")
CountT=0
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
    sudo rm -rf clab-cenario00
    sudo rm -rf .cenario00.clab.yml.bak
else
    echo "State: DOWN - Docker container: $CountT"iperf3 -c 10.10.10.25 -u -b 1000M 
    echo "Remove folders generate by clab"
    sudo rm -rf clab-cenario00
    sudo rm -rf .cenario00.clab.yml.bak
fi

echo "Total: $CountT"
####################################################################################