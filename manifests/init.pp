# == Class: tomcat
#
# Full description of class tomcat here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class tomcat (
  $package_name = $tomcat::params::package_name,
  $service_name = $tomcat::params::service_name,
) inherits tomcat::params {

  # validate parameters here

  class { 'tomcat::install': } ->
  class { 'tomcat::config': } ~>
  class { 'tomcat::service': } ->
  Class['tomcat']
}
