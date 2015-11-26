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
    unless  => 'test -e /opt/jirainstall',
    user    => root,
    cwd     => '/opt/',
    command => 'mkdir jirainstall',
    before  => Exec['jira_wget'],
  }

  exec { 'jira_wget':
    unless  => 'test -f /opt/jirainstall/jira.bin',
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'wget http://192.168.1.17/jira.bin', #takes the jira file from phils $
    timeout => 0,
    before  => Exec['jira_chmod'],
  }

  exec { 'jira_chmod':
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'chmod a+x jira.bin',
    before  => Exec['kill_jira'],

  }

  exec { 'kill_jira':
    unless  => 'pgrep -f "jira"',
    command => 'pkill jira',
    notify  => Exec['jira_execute'],
  }

  exec { 'jira_execute':
    unless  => 'pgrep -f "jira"',
    user    => root,
    cwd     => '/opt/jirainstall/',
    command => 'printf "\n2\n\n\n2\n8092\n8012\n\n" | ./jira.bin', #the ports may ha$
    #before  => Service['jira'],
  }

  #service { 'jira': This is not needed yet, maybe in the future.
    #ensure => 'running',
  #}

}