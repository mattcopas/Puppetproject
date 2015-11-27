#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y puppet puppetmaster
sudo apt-get install -y git
sudo apt-get install -y tree

# disables the firewall so that putty can connect
sudo ufw disable