#!/usr/bin/env bash

yum update

yum install -y openssh-server
yum install -y openssh-client
yum install -y puppet
# set the system time to a ntp server
ntpdate 0.uk.pool.ntp.org

# disables the firewall so that putty can connect
service iptables stop

puppet resource package puppet ensure=latest