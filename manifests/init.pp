# == Class: tomcat
#
# Installs and configures Apache Tomcat from a package
# created by tomcat-packager
#
# === Parameters
#  [*remove_default_page*]
#    Removes the default Tomcat installation page, defaults to false
#
# === Examples
#
#  class { 'tomcat': }
#
class tomcat (
  $package_name     = $tomcat::params::package_name,
  $package_version  = $tomcat::params::package_version,
  $service_name     = $tomcat::params::service_name,
) inherits tomcat::params {

  validate_string($version)
  validate_re($::osfamily, '^(Debian|Ubuntu)$', 'Whilst it is intended to make this module work for Red Hat based systems, it currently is tested only with Debian and Ubuntu based systems.')

  class { 'tomcat::install': } ->
  class { 'tomcat::config': } ~>
  class { 'tomcat::service': } ->
  Class['tomcat']
}
