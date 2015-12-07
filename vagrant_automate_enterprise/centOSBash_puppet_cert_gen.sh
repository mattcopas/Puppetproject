#!/usr/bin/env bash

#generate a certificate from the agent
#puppet agent --test --server=masterEvilcorp.evilcorp.com --waitforcert=30
#puppet agent --enable -v


#generate a certificate from the agent and download configuration from enterprise master
sudo curl -k https://masterevilcorp.evilcorp.com:8140/packages/current/install.bash | sudo bash