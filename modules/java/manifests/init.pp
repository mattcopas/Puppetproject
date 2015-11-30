class java {
  
#------------------------------------------------------------------
#  The java executables
#------------------------------------------------------------------

  if $operatingsystem == 'Ubuntu' {

    #This should install both jdk and jre as default-jdk comes with the other package
  
    if ! defined(Package['default-jdk']) {
      package { 'default-jdk':
        ensure => 'installed',
      }
    }	
  
  }elsif $operatingsystem == 'CentOS' {
  
    if ! defined(Package['java-1.7.0-openjdk']) {
      package { 'java-1.7.0-openjdk':
        ensure => installed,
      }
    }   

  }else {
    warning( 'Operating System is not supported.' )
  }
  
}