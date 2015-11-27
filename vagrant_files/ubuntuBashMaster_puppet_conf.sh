#!/usr/bin/env bash

sudo -i
rm -f /etc/puppet/puppet.conf
cat > /etc/puppet/puppet.conf

sudo echo '[main]' >> /etc/puppet/puppet.conf
sudo echo 'server=masterEvilcorp.evilcorp.com' >> /etc/puppet/puppet.conf
sudo echo 'logdir=/var/log/puppet' >> /etc/puppet/puppet.conf
sudo echo 'vardir=/var/lib/puppet' >> /etc/puppet/puppet.conf
sudo echo 'ssldir=/var/lib/puppet/ssl' >> /etc/puppet/puppet.conf
sudo echo 'rundir=/var/run/puppet' >> /etc/puppet/puppet.conf
sudo echo 'factpath=$vardir/lib/facter' >> /etc/puppet/puppet.conf
sudo echo 'templatedir=$confdir/templates' >> /etc/puppet/puppet.conf
sudo echo 'prerun_command=/etc/puppet/etckeeper-commit-pre' >> /etc/puppet/puppet.conf
sudo echo 'postrun_command=/etc/puppet/etckeeper-commit-post' >> /etc/puppet/puppet.conf
sudo echo '' >> /etc/puppet/puppet.conf
sudo echo '[master]' >> /etc/puppet/puppet.conf
sudo echo '# These are needed when the puppetmaster is run by passenger' >> /etc/puppet/puppet.conf
sudo echo '# and can safely be removed if webrick is used' >> /etc/puppet/puppet.conf
sudo echo 'ssl_client_header = SSL_CLIENT_S_DN' >> /etc/puppet/puppet.conf
sudo echo 'ssl_client_verify_header = SSL_CLIENT_VERIFY' >> /etc/puppet/puppet.conf
sudo echo 'autosign = true' >> /etc/puppet/puppet.conf

sudo echo '[agent]' >> /etc/puppet/puppet.conf
sudo echo 'runinterval = 5m' >> /etc/puppet/puppet.conf
sudo echo 'reporting = true' >> /etc/puppet/puppet.conf

exit