#!/usr/bin/env bash

# creating a site.pp file
sudo touch /etc/puppet/manifests/site.pp

# adding nodes to site.pp

echo "node 'agent1Evilcorp.evilcorp.com' { "
echo '  include java' >> /etc/puppet/manifests/site.pp
echo '  include git' >> /etc/puppet/manifests/site.pp
echo '  include maven' >> /etc/puppet/manifests/site.pp
echo '  include jenkins' >> /etc/puppet/manifests/site.pp
echo '  include jira' >> /etc/puppet/manifests/site.pp
echo '}'

echo "node default { "
echo '  include java' >> /etc/puppet/manifests/site.pp
echo '  include git' >> /etc/puppet/manifests/site.pp
echo '}'