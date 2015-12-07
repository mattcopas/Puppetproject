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