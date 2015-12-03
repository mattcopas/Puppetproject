#!/usr/bin/env bash

# naviagte to the directory of modules
cd /tmp

# clone from the repository, cannot yet get cloning one branch working
git clone  https://github.com/mattcopas/Puppetproject.git

# copy modules folder from repository into puppet
sudo rm -rf /etc/puppetlabs/code/environments/production/modules
sudo mv /tmp/Puppetproject/modules /etc/puppetlabs/code/environments/production