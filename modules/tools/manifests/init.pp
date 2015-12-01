class tools {
  
  if ! defined(Package['wget']) {
    package { 'wget':
      ensure => installed,
    }
  }
  
}