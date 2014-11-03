# == Class tomcat::params
#
# Default parameter values for the Tomcat Module
#
class tomcat::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'tomcat'
      $service_name = 'tomcat'
    }
    'Ubuntu': {
      $package_name = 'tomcat'
      $service_name = 'tomcat'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
