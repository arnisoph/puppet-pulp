# == Class: pulp::consumer::service
#
class pulp::consumer::service {

  service { 'pulp_consumer_service':
    ensure => running,
    name   => $::pulp::consumer::consumer_servicename,
    enable => true,
  }
}
