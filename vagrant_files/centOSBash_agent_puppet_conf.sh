#!/usr/bin/env bash

rm -f /etc/puppet/puppet.conf
touch /etc/puppet/puppet.conf

echo '[main]' >> /etc/puppet/puppet.conf
echo 'server=masterEvilcorp.evilcorp.com' >> /etc/puppet/puppet.conf
echo 'logdir=/var/log/puppet' >> /etc/puppet/puppet.conf
echo 'vardir=/var/lib/puppet' >> /etc/puppet/puppet.conf
echo 'ssldir=/var/lib/puppet/ssl' >> /etc/puppet/puppet.conf
echo 'rundir=/var/run/puppet' >> /etc/puppet/puppet.conf
echo 'factpath=$vardir/lib/facter' >> /etc/puppet/puppet.conf
echo 'templatedir=$confdir/templates' >> /etc/puppet/puppet.conf
echo 'prerun_command=/etc/puppet/etckeeper-commit-pre' >> /etc/puppet/puppet.conf
echo 'postrun_command=/etc/puppet/etckeeper-comit-post' >> /etc/puppet/puppet.conf
echo '' >> /etc/puppet/puppet.conf
echo '[master]' >> /etc/puppet/puppet.conf
echo '# These are needed when the puppetmaster is run by passenger' >> /etc/puppet/puppet.conf
echo '# and can safely be removed if webrick is used' >> /etc/puppet/puppet.conf
echo 'ssl_client_header = SSL_CLIENT_S_DN' >> /etc/puppet/puppet.conf
echo 'ssl_client_verify_header = SSL_CLIENT_VERIFY' >> /etc/puppet/puppet.conf

echo '[agent]' >> /etc/puppet/puppet.conf
echo 'runinterval = 5m' >> /etc/puppet/puppet.conf
