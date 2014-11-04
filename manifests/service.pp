# == Class tomcat::service
#
# This class is meant to be called from tomcat
# It ensure the service is running
#
class tomcat::service {

   file { 'tomcat conf':
    ensure  => file,
    path    => '/etc/init/tomcat.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('tomcat/etc/init/tomcat.conf'),
  }

  

  service { $tomcat::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
