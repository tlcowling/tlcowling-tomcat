# == Class tomcat::service
#
# This class is meant to be called from tomcat
# It ensure the service is running
#
class tomcat::service {

  service { $tomcat::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
