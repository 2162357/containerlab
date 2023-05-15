#!/bin/bash

apt update
#apt upgrade
#apt install vim nano net-tools traceroute iproute2 netscript-2.4 iputils-ping telnet iperf3 openssh-server tcpdump zabbix-agent -y

# Define IP Address to eth1
ip addr add 172.99.99.26/24 dev eth1

# Copy new config file to the original location
cp /etc/zabbix/temp/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
cp /etc/ssh/temp/ssh_config /etc/ssh/ssh_config
#Start zabbix agent
service zabbix-agent start
service ssh start