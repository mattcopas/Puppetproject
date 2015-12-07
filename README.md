# Puppetproject

###########################
#   VAGRANT_FILE VERSION  #
###########################

1) Place vagrantfile and all .sh scripts into a folder.
2) Navigate to this folder through git bash.
3) Execute command 'vagrant up' and wait.
4) Congraulations your master and agents are communicating and pulling configuration changes every 5 minutes!*

*nexus does not work on CentOS, jenkins must be manually started on CentOS, LAN must be changed to area 200 in order to view jenkins and jira browsers

#################################
#   VAGRANT_ENTERPRISE VERSION  #
#################################

1) Place vagrantfile and all .sh scripts into a folder.
2) Navigate to this folder through git bash.
3) Execute command 'vagrant up' and wait.
4) Once the entire installation is complete the Enterprise console can be accessed at (to sign certificates and use MCollective):
  https:// 192.168.1.250
5) Or to sign certificates log onto the master VM and execute 'sudo puppet cert sign --all' 
6) To access zabbix go to '192.168.1.250/zabbix'
  User = admin, Password = zabbix
7) On the master turn the zabbix agent on: 'sudo service zabbix-agent start'. NB: wait for master-agent to do a puppet run in order to install zabbix agent