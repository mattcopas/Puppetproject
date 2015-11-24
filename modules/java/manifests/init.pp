# 
class java {
  
  if ! defined(Package['default-jre']) {
    package { 'default-jre':
      ensure => 'installed',
    }
  }
  
  if ! defined(Package['default-jdk']) {
    package { 'default-jdk':
      ensure => 'installed',
    }
  }
  
}