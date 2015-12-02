#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y puppet
# set the system time to a ntp server
sudo ntpdate 0.uk.pool.ntp.org

# disables the firewall so that putty can connect
sudo ufw disable