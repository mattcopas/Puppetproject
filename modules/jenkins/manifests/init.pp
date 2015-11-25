class jenkins {

  Exec {
    path => [
      '/usr/local/bin',
      '/opt/local/bin',
      '/usr/bin',
      '/bin',
      '/sbin'],
    logoutput => true,
  }

  #Below are the packages needed in order for jenkins to be installed

  if ! defined(Package['wget']) {
    package { 'wget':
      ensure => installed,
      before => Package['default-jre'],
    }
  }

  if ! defined(Package['default-jre']) {
    package { 'default-jre':
      ensure => installed,
      before => Exec['download_jenkins_key'],
    }
  }

  #Executes

  exec {'download_jenkins_key':
    user    => root,
    command => 'wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -',
    before  => Exec['echo_jenkins_source'],
  }

  exec {'echo_jenkins_source':
    user    => root,
    command => "sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
    before  => Exec['apt_update'],
  }

  exec { 'apt_update':
    user    => root,
    command => 'apt-get update',
    before  => Package['jenkins'],
  }

  package { 'jenkins':
      ensure => installed,
  }


#  exec {'install_jenkins':
#    user    => root,
#    command => 'apt-get install -y jenkins',
#    timeout => 0,
#  }

}