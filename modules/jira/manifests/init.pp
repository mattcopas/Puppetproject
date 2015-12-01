class jira {

  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }

  #this will ensure the node has wget
#  if ! defined(Package['jira-wget']) {
#    package { 'wget':
#      ensure => installed,
#      before => Exec['jira_mkdir'],
#    }
#  }
  #this will make the directory for the download
  exec { 'jira_mkdir':
    unless  => 'test -e /opt/jirainstall',
    user    => root,
    cwd     => '/opt/',
    command => 'mkdir jirainstall',
    before  => Exec['jira_wget'],
  }
  #this will change to download direcotry and download jira install file
  exec { 'jira_wget':
    # Check if file already exists
    unless  => 'test -f /opt/jirainstall/jira.bin',
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'wget http://192.168.1.17/jira.bin', #takes the jira file from phils $
    timeout => 0,
    before  => Exec['jira_chmod'],
  }
  #this will change permissions of the install file
  exec { 'jira_chmod':
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'chmod a+x jira.bin',
    before  => Exec['jira_execute'],
  }
  #this will kill any existing jira processes to free up the ports
  #exec { 'kill_jira':
    # Check if jira process is running
    #unless  => 'pgrep -f "jira"',
    #command => 'pkill jira',
    #notify  => Exec['jira_execute'],
  #}

  exec { 'jira_execute':
    # Check if jira process is running
    #unless  => 'pgrep -f "jira"',
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'printf "\n2\n\n\n2\n8100\n8020\n\n" | ./jira.bin', #the ports may ha$
    before  => Exec['remove_jira_lock'],
  }

  exec { 'remove_jira_lock':
    #delete jira lock
    user    => root,
    command => 'rm -rf /var/atlassian/application-data/jira/.jira-home.lock',
    before  => Exec['disable_centos_firewall'],
  }

  #service { 'jira': #This is not needed yet, maybe in the future.
    #ensure => 'running',
  #}

  if $operatingsystem == 'CentOS' {
    #if the os is centos the firewall must be stopped and disabled
    exec { 'stop_centos_firewall':
      user    => root,
      command => "systemctl stop firewalld",
      before  => Exec['disable_centos_firewall'],
    }
    exec { 'disable_centos_firewall':
      user    => root,
      command => "systemctl disable firewalld",
    }
  }
} 