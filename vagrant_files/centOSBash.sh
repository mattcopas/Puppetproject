#!/usr/bin/env bash

dhclient
yum update

yum install -y openssh-server
yum install -y openssh-client
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install -y puppet
# set the system time to a ntp server
ntpdate 0.uk.pool.ntp.org

# disables the firewall so that putty can connect
service iptables stop

puppet resource package puppet ensure=latest