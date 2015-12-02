# Puppetproject

###########################
#   VAGRANT_FILE VERSION  #
###########################

1) Place vagrantfile and all .sh scripts into a folder.
2) Navigate to this folder through git bash.
3) Execute command 'vagrant up' and wait.
4) Congraulations your master and agents are communicating and pulling configuration changes every 5 minutes!



nexus does not work on CentOS
jenkins must be manually started on CentOS

LAN must be changed to area 200

#################################
#   VAGRANT_ENTERPRISE VERSION  #
#################################

1) Place vagrantfile and all .sh scripts into a folder.
2) Navigate to this folder through git bash.
3) Execute command 'vagrant up' and wait.
4) When prompted open a browser window and enter the address :
  https://192.168.1.250:3000
5) Accept the security cert.
6) Click the start button.
7) Select the Monolithic install
8) Enter the master FQDN as :
  masterevilcorp.evilcorp.com
9) Enter another DNS alias separted by a comma :
  masterEvilcorp
10) Set the admin password to something memorable, hint hint netbuilder. Note superuser name is admin. 
11) Click submit and click continue
12) Ignore any warnings and click 'Deploy now'. NB: may be up to 30 minutes, click the page now and then so it doesn't time out. (If a warning is red click the back button twice and repeat these steps until it goes away).
13)Once ready click 'Start using Puppet Enterprise'
14) Open the awful firefox browser on the Linux machine. 
15) Enter the URL as :
  https://masterevilcorp.evilcorp.com
16) If it fails just repeat the step over and over until it gives a certifcate warning. Accept the cert.
17) Well done, you're in.
18) Wait for all other VM's to be created.
19) From the Enterprise dashboard you can now navigate to 'Nodes' and sign certificates.