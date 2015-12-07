#!/usr/bin/env bash

sudo echo 'autosign = true' >> /etc/puppetlabs/puppet/puppet.conf
sudo echo 'reporturl = http://192.168.1.250:3000/reports/upload' >> /etc/puppetlabs/puppet/puppet.conf
sudo echo 'autosign = true' >> /etc/puppet/puppet.conf