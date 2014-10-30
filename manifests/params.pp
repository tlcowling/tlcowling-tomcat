# == Class tomcat::params
#
# This class is meant to be called from tomcat
# It sets variables according to platform
#
class tomcat::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'tomcat6'
      $service_name = 'tomcat6'
    }
    'Ubuntu': {
      $package_name = 'tomcat6'
      $service_name = 'tomcat6'
    }
    'RedHat', 'Amazon': {
      $package_name = 'tomcat6'
      $service_name = 'tomcat6'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
