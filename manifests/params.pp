# == Class tomcat::params
#
# Default parameter values for the Tomcat Module
#
class tomcat::params (
  $package_name     = 'tomcat',
  $service_name     = 'tomcat',
  $package_version  = '7'
) {
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

  $prerequired_packages = $::operatingsystem ? {
    'Ubuntu' => [ 'oracle-java7-installer' ],
    default  => '',
  }
}
