#!/usr/bin/env bash

# naviagte to the directory of modules
cd /tmp

# clone from the repository, cannot yet get cloning one branch working
git clone  https://github.com/mattcopas/Puppetproject.git

# remove current module folder
sudo rmdir /etc/puppet/modules

# copy modules folder from repository into puppet
sudo mv /tmp/Puppetproject/modules /etc/puppet