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
	path   => '/usr/local',
	notify => Exec['unzip_nexus'],
  }
  
  exec { 'unzip_nexus':
    cwd    => '/usr/local',
	comand => 'tar -zxvf nexus-latest-bundle.tar.gz',
	notify => Exec['modify_env_nexus'],
  }
  
  # Change this to a bash script to execute?
  exec { 'modify_env_nexus':
    cwd     => '/etc/',
	command => [
	  'cat environment >> environment',
	  "echo NEXUS_HOME='/usr/local/nexus-2.11.4-01/bin'"
	],
	notify => Exec['source_environment'],
  }
  
  exec { 'source_environment':
	command => 'source /etc/environment',
	notify  => Exec['link_nexus'],
  }
  
  exec { 'link_nexus':
    cwd => '/usr/local',
	command => 'ln -s nexus-2.11.4-01 nexus',
  }
  
}