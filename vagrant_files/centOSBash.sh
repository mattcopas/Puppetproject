#!/usr/bin/env bash

yum update

yum install -y openssh-server
yum install -y openssh-client
yum install -y puppet

# disables the firewall so that putty can connect
service iptables stop

puppet resource package puppet ensure=latest