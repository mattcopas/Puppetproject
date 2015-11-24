#Manifests for maven module
#Author: Daniel Dos Santos
class maven {
  package { 'maven' :
    ensure => installed,
  }
}