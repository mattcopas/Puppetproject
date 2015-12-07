#!/usr/bin/env bash

# modifying the hosts file with the master and agent ipaddress 
# delete and replace the hosts file
rm -f /etc/hosts
cat > /etc/hosts

echo "192.168.200.200	masterevilcorp.evilcorp.com	masterevilcorp" >> /etc/hosts
echo "127.0.1.1	agent2evilcorp.evilcorp.com	agent2evilcorp" >> /etc/hosts
echo "127.0.1.1	localhost" >> /etc/hosts
echo "127.0.0.1	agent2evilcorp" >> /etc/hosts
echo "# the following lines are desirable for IPv6 capable hosts" >> /etc/hosts
echo "::1 ip6-localhost ip6-loopback" >> /etc/hosts
echo "fe00::0 ip6-localnet" >> /etc/hosts
echo "ff00::0 ip6-mcastprefix" >> /etc/hosts
echo "ff02::1 ip6-allnodes" >> /etc/hosts
echo "ff02::2 ip6-allrouters" >> /etc/hosts
echo "ff02::3 ip6-allhosts" >> /etc/hosts
