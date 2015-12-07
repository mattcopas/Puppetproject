###########################
#   VAGRANT_FILE VERSION  #
###########################

1) Place vagrantfile and all .sh scripts into a folder.
2) Navigate to this folder through git bash.
3) Execute command 'vagrant up' and wait.
4) Congraulations your master and agents are communicating and pulling configuration changes every 5 minutes!*

*nexus does not work on CentOS, jenkins must be manually started on CentOS, LAN must be changed to area 200 in order to view jenkins and jira browsers

For VM machine access:
  The login name is 'Vagrant'
  The login password is 'vagrant'
  Toa ccess CentOS machine inside git bash type: 'vagrant ssh cluster_3'
