#!/usr/bin/env bash

sudo rm -f /etc/puppetlabs/code/environments/production/manifests/site.pp
# creating a site.pp file
sudo touch /etc/puppetlabs/code/environments/production/manifests/site.pp

# adding nodes to site.pp

echo "node 'agent1Evilcorp.evilcorp.com' { " >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include tools' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include git' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include java' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include maven' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include jenkins' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include jira' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include nexus' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
#echo '  include zabbix' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp

echo "node 'agent2Evilcorp.evilcorp.com' { " >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include tools' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include git' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include java' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include maven' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include jenkins' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include jira' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include zabbix' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
#echo '  include nexus' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp

echo "node 'agent3Evilcorp.evilcorp.com' { " >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include tools' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include git' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include java' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include maven' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
#echo '  include jenkins' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
#echo '  include jira' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include zabbix' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
#echo '  include nexus' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp

echo "node default { " >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include tools' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include git' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '  include zabbix' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
echo '}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp