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

  exec { 'jira_mkdir':
    user    => root,
    cwd     => '/opt/',
    command => 'mkdir jirainstall',
    notify  => Exec['jira_wget'],
  }

  exec { 'jira_wget': 
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'wget http://aaronmulholland.co.uk/jira.bin',
    notify  => Exec['jira_chmod'],
  }

  exec { 'jira_chmod': 
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'chmod a+x jira.bin',
    notify  => Exec['jira_execute'],

  }

  exec { 'jira_execute':
    user => root,
    cwd  => '/opt/jirainstall/',
    command => 'printf "y\no\n2\n/opt/jira\n/var/atlassian/application-data/jira\n1\ny\n" | ./jira.bin',#this line is bollocks
    notify => Service['jira'],
  }

  service { 'jira':
    ensure => 'running',
  }

}