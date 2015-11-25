#!/usr/bin/env bash

# enable auto signing of certificates 
# NB: only way to make vagrant up work BUT security issues DO NOT USE FOR PRODUCTION ENVIRONMENT
sudo echo 'autosign = true' >> /etc/puppet/puppet.conf