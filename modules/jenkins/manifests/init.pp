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
    }
  }

  if ! defined(Package['java']) {
    package { 'java':
      ensure => installed,
    }
  }

  #Executes 

  exec {'create_directory_jenkins':
    cwd     => '/opt/',
    command => 'mkdir jenkins/',
    notify  => Exec['download_jenkins'],
  }

  exec {'download_jenkins':
    cwd     => '/opt/jenkins/',
    user    => 'root',
    command => 'wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -',
    timeout => 0,
    notify  => Exec['echo_jenkins'],
  }

  exec {'echo_jenkins':
    command => "sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
    notify  => Exec['update_jenkins'],
  }

  exec {'update_jenkins':
    user    => 'root',
    command => 'sudo apt-get update',
    notify  => Exec['install_jenkins'],
  }

  exec {'install_jenkins':
    user    => 'root',
    command => 'sudo apt-get install -y jenkins',
  }

}