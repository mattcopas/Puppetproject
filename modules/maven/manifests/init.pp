#Manifests for maven module
#Author: Daniel Dos Santos & Edward Williams
class maven {

  if $operatingsystem =='Ubuntu' {
    package { 'maven' :
     ensure => installed,
    }
  }

  elsif $operatingsystem == 'CentOS' {
    package { 'maven' :
     ensure => installed,
    }
  }

  else {
    warning( 'Operating system not supported' )
  }
}