#!/bin/bash

cat > /etc/network/interfaces << EOF
auto eth0
iface eth0 inet dhcp

auto eth1

iface eth1 inet static
  address 10.20.20.27
  netmask 255.255.255.0
  gateway 10.20.20.1

EOF

ifup eth1

ip route add 10.10.10.0/24 via 10.20.20.1

apt update
apt install vim
apt install nano
apt install net-tools
apt install iputils-ping
apt install telnet
apt install iperf3
apt install openssh-server
apt install zabbix-agent

