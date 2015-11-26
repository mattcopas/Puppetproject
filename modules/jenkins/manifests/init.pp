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
  
  if $operatingsystem == 'Ubuntu' {

    #Ubuntu

      exec {'download_jenkins_key':
        user    => root,
        command => 'wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -',
        before  => Exec['jenkins_source'],
      }

      exec {'jenkins_source':
        user    => root,
        command => "sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
        before  => Exec['jenkins_update'],
      }

      exec { 'jenkins_update':
        user    => root,
        command => 'apt-get update',
        before  => Package['jenkins'],
      }

  }elsif $operatingsystem == 'CentOS' {

    #CentOS

      exec {'download_jenkins_key':
        user    => root,
        command => 'wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo',
        before  => Exec['jenkins_source'],
      }
    
      exec {'jenkins_source':
        user    => root,
        command => "rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
        before  => Exec['jenkins_update'],
      }
    
      exec { 'jenkins_update':
        user    => root,
        command => 'yum update',
        before  => Package['jenkins'],
      }
    
  }else {
    warning( 'Operating System is not supported.' )
  }

  package { 'jenkins':
      ensure => installed,
  }

}