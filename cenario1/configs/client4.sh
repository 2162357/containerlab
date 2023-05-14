#!/bin/bash

apt update
#apt upgrade
apt install vim nano net-tools iproute2 netscript-2.4 iputils-ping telnet iperf3 openssh-server zabbix-agent -y

ip addr add 10.20.20.25/24 dev eth1
ip route add 10.10.10.0/24 via 10.20.20.1
ip route add 1.1.1.1/32 via 10.10.10.1
ip route add 2.2.2.2/32 via 10.10.10.1

cp /etc/zabbix/temp/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
service zabbix-agent start