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
    before  => Exec['jira_wget'],
  }

  exec { 'jira_wget':
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'wget http://192.168.1.17/jira.bin', #takes the jira file from phils server
	timeout => 0,
    before  => Exec['jira_chmod'],
  }

  exec { 'jira_chmod':
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'chmod a+x jira.bin',
    before  => Exec['jira_execute'],

  }

  exec { 'jira_execute':
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'printf "\n2\n\n\n2\n8092\n8012\n\n" | ./jira.bin', #the ports may have to be changed
    #before  => Service['jira'],
  }

  #service { 'jira': This is not needed yet, maybe in the future.
    #ensure => 'running',
  #}

}