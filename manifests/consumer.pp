# == Class: pulp::consumer
#
class pulp::consumer (
  $server_host          = $::hostname,
  $server_port          = '443',
  $consumer_servicename = $::pulp::params::consumer_servicename,
  $consumer_packages    = $::pulp::params::consumer_packages,
) inherits pulp::params {

  validate_string($server_host)
  validate_string($server_port)
  validate_string($consumer_servicename)
  validate_array($consumer_packages)

  contain ::pulp::consumer::install
  contain ::pulp::consumer::config
  contain ::pulp::consumer::service

  Class ["${name}::install"]
  -> Class ["${name}::config"]
  -> Class ["${name}::service"]
}
