#!/bin/bash

apt update
#apt upgrade
#apt install vim nano net-tools traceroute iproute2 netscript-2.4 iputils-ping telnet iperf3 openssh-server zabbix-agent -y

# Define IP Address to eth1
ip addr add 10.10.10.25/24 dev eth1
# ADD Routes
ip route add 10.20.20.0/24 via 10.10.10.1
ip route add 1.1.1.1/32 via 10.10.10.1
ip route add 2.2.2.2/32 via 10.10.10.1

# Copy new config file to the original location
cp /etc/zabbix/temp/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
#Start zabbix agent
service zabbix-agent start