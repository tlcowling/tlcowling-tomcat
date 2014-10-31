# == Class tomcat::config
#
# This class is called from tomcat
#
# === Parameters
#  [*remove_default_page*]
#    Removes the default Tomcat installation page, defaults to false
#
# === Examples
#
#  class { 'tomcat::config':
#    remove_default_page => true
#  }
#
# === Authors
#
#  Tom Cowling <tom.cowling@gmail.com>
#
class tomcat::config (
  $remove_default_page = false,
  $version             = '6'
) {
  if ($remove_default_page) {
    file { '/var/lib/tomcat6/webapps/ROOT/index.html':
      ensure => absent,
    }
  }
}
