# == Class tomcat::install
#
class tomcat::install {

  package { $tomcat::package_name:
    ensure => present,
  }

}
