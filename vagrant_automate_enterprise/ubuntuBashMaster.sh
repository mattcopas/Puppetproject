#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y git
sudo apt-get install -y tree

# set the system time to a ntp server
sudo ntpdate 0.uk.pool.ntp.org

# disables the firewall so that putty can connect
sudo ufw disable

# enterprise installation
cd /tmp
sudo wget --no-check-certificate 'https://pm.puppetlabs.com/cgi-bin/download.cgi?dist=ubuntu&rel=14.04&arch=amd64&ver=latest'
sudo tar -xvf 'download.cgi?dist=ubuntu&rel=14.04&arch=amd64&ver=latest'
mv puppet-enterprise-2015.2.3-ubuntu-14.04-amd64 /opt/
cd /opt/puppet-enterprise-2015.2.3-ubuntu-14.04-amd64
sudo yes | ./puppet-enterprise-installer