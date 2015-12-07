#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y git
sudo apt-get install -y tree

# set the system time to a ntp server
sudo ntpdate 0.uk.pool.ntp.org

# disables the firewall so that putty can connect
sudo ufw disable

# generate an answer file for automated enterprise install
cd /tmp
sudo touch answer_file.txt
sudo echo "q_activity_database_name='pe-activity'" >> answer_file.txt
sudo echo "q_activity_database_password='netbuilder'" >> answer_file.txt
sudo echo "q_activity_database_user='pe-activity'" >> answer_file.txt
sudo echo "q_all_in_one_install='y'" >> answer_file.txt
sudo echo "q_classifier_database_name='pe-classifier'" >> answer_file.txt
sudo echo "q_classifier_database_password='netbuilder'" >> answer_file.txt
sudo echo "q_classifier_database_user='pe-classifier'" >> answer_file.txt
sudo echo "q_database_host='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_database_install='y'" >> answer_file.txt
sudo echo "q_database_port='5432'" >> answer_file.txt
sudo echo "q_database_root_password='netbuilder'" >> answer_file.txt
sudo echo "q_database_root_user='root'" >> answer_file.txt
sudo echo "q_fail_on_unsuccessful_master_lookup='y'" >> answer_file.txt
sudo echo "q_install='y'" >> answer_file.txt
sudo echo "q_pe_check_for_updates='y'" >> answer_file.txt
sudo echo "q_pe_database='y'" >> answer_file.txt
sudo echo "q_public_hostname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppet_cloud_install='y'" >> answer_file.txt
sudo echo "q_puppet_enterpriseconsole_auth_password='netbuilder'" >> answer_file.txt
sudo echo "q_puppet_enterpriseconsole_httpd_port='443'" >> answer_file.txt
sudo echo "q_puppet_enterpriseconsole_install='y'" >> answer_file.txt
sudo echo "q_puppet_enterpriseconsole_master_hostname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetagent_certname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetagent_install='y'" >> answer_file.txt
sudo echo "q_puppetagent_server='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetdb_database_name='pe-puppetdb'" >> answer_file.txt
sudo echo "q_puppetdb_database_password='netbuilder'" >> answer_file.txt
sudo echo "q_puppetdb_database_user='pe-puppetdb'" >> answer_file.txt
sudo echo "q_puppetdb_hostname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetdb_install='y'" >> answer_file.txt
sudo echo "q_puppetdb_plaintext_port='8080'" >> answer_file.txt
sudo echo "q_puppetdb_port='8081'" >> answer_file.txt
sudo echo "q_puppetmaster_certname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetmaster_dnsaltnames='puppet,masterevilcorp,masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetmaster_enterpriseconsole_hostname='masterevilcorp.evilcorp.com'" >> answer_file.txt
sudo echo "q_puppetmaster_enterpriseconsole_port='443'" >> answer_file.txt
sudo echo "q_puppetmaster_install='y'" >> answer_file.txt
sudo echo "q_rbac_database_name='pe-rbac'" >> answer_file.txt
sudo echo "q_rbac_database_password='netbuilder'" >> answer_file.txt
sudo echo "q_rbac_database_user='pe-rbac'" >> answer_file.txt
sudo echo "q_skip_backup='y'" >> answer_file.txt
sudo echo "q_skip_master_verification='n'" >> answer_file.txt
sudo echo "q_vendor_packages_install='y'" >> answer_file.txt

# enterprise installation
cd /tmp
#sudo wget --no-check-certificate 'https://pm.puppetlabs.com/cgi-bin/download.cgi?dist=ubuntu&rel=14.04&arch=amd64&ver=latest'
sudo wget 'http://192.168.1.6:8080/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz'
sudo tar -xvf 'puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz'
#sudo tar -xvf 'download.cgi?dist=ubuntu&rel=14.04&arch=amd64&ver=latest'
mv puppet-enterprise-2015.2.0-ubuntu-14.04-amd64 /opt/
cd /opt/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64
sudo printf 'y\n' | ./puppet-enterprise-installer -D -a /tmp/answer_file.txt