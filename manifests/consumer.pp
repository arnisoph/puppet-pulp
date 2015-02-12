# == Class: pulp::consumer
#
class pulp::consumer (
  $server_host          = $::hostname,
  $server_port          = '443',
  $consumer_servicename = $::pulp::params::consumer_servicename,
  $consumer_packages    = $::pulp::params::consumer_packages,
  $verify_ssl           = true,
  $messaging_scheme     = 'amqp',
  $messaging_host       = undef,
  $messaging_port       = 5672,
  $messaging_transport  = 'qpid',
  $messaging_cacert     = undef,
  $messaging_clientcert = undef,
) inherits pulp::params {

  validate_string($server_host)
  validate_string($server_port)
  validate_string($consumer_servicename)
  validate_array($consumer_packages)
  validate_bool($verify_ssl)
  validate_string($messaging_scheme)
  validate_string($messaging_host)
  if ! is_integer($messaging_port) {
    fail("pulp::consumer::messaging_port `${messaging_port}' is not an interger")
  }
  validate_string($messaging_transport)
  if $messaging_cacert {
    validate_string($messaging_cacert)
    validate_string($messaging_clientcert)
  }

  contain ::pulp::consumer::install
  contain ::pulp::consumer::config
  contain ::pulp::consumer::service

  Class ["${name}::install"]
  -> Class ["${name}::config"]
  -> Class ["${name}::service"]
}
