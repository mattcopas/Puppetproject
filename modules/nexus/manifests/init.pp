class nexus {
  
  #
  #	Permissions need to be changed
  #
  
  # Variables
  $nexus_path = ''
  
  # Exec paths 
  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }
  
  # Steps here
  
  file { 'nexus_tar':
    ensure => 'file',
	source => 'puppet:///modules/nexus/nexus-latest-bundle.tar.gz',
	path   => '/usr/local/nexus-latest-bundle.tar.gz',
	notify => Exec['unzip_nexus'],
  }
  
  exec { 'unzip_nexus':
    cwd    => '/usr/local',
	command => 'tar -zxvf nexus-latest-bundle.tar.gz',
	notify => File['modify_env_nexus_script'],
  }
  
  file { 'modify_env_nexus_script':
    ensure => 'file',
	source => 'puppet:///modules/nexus/modify_env_nexus.sh',
	path   => '/usr/local/bin/modify_env_nexus_script.sh',
	mode   => '0744',
	notify => Exec['modify_env_nexus_run'],
  }
  
  exec { 'modify_env_nexus_run':
    command => '/usr/local/bin/modify_env_nexus_script.sh',
	notify  => File['source_environment_script'],
  }
  
  # Change this to a bash script to execute?
  #exec { 'modify_env_nexus':
  # cwd     => '/etc/',
  #	command => [
  #	  'cat environment >> environment',
  #	  "echo NEXUS_HOME='/usr/local/nexus-2.11.4-01/bin'"
  #	],
  #	notify => Exec['source_environment'],
  #}
  
  file { 'source_environment_script':
    ensure => 'file',
	source => 'puppet:///modules/nexus/source_environment.sh',
	path   => '/usr/local/bin/source_environment.sh',
	mode   => '0744',
	notify => Exec['source_environment_run'],
  }
  
  exec { 'source_environment_run':
    command => '/usr/local/bin/source_environment.sh',
	notify  => Exec['link_nexus'],
  }
  
#  exec { 'source_environment':
#	command => 'source /etc/environment',
#	notify  => Exec['link_nexus'],
#  }
  
  exec { 'link_nexus':
    cwd => '/usr/local',
	command => 'ln -s nexus-2.11.4-01 nexus',
	creates => '/usr/local/nexus-2.11.4-01/nexus',
	notify  => Exec['change_nexus_permissions'],
  }
  
  exec { 'change_nexus_permissions':
    cwd     => '/usr/local/nexus-2.11.4-01/bin',
	command => 'chmod a+x nexus',
  }
  
}