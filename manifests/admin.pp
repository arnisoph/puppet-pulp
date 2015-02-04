# == Class: pulp::admin
#
class pulp::admin (
  $server_host      = $::fqdn,
  $server_port      = '443',
  $admin_verify_ssl = true,
  $admin_ca_path    = '/etc/pki/tls/certs/ca-bundle.crt',
  $admin_packages   = $::pulp::params::admin_packages,
) inherits pulp::params {

  validate_string($server_host)
  validate_string($server_port)
  validate_bool($admin_verify_ssl)
  validate_string($admin_ca_path)
  validate_array($admin_packages)

  contain ::pulp::admin::install
  contain ::pulp::admin::config

  Class["${name}::install"]
  -> Class["${name}::config"]
}

