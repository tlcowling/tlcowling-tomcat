# == Class tomcat::install
#
class tomcat::install {
  package { $tomcat::package_name:
    ensure => present,
  }
  file { 'Tomcat Upstart':
    ensure  => file,
    path    => '/etc/init/tomcat.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('tomcat/etc/init/tomcat.conf'),
    require => Package[$tomcat::package_name],
  }
}
