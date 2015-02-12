# == Class: pulp::server
#
class pulp::server (
  $default_login                = 'admin',
  $default_password             = 'admin',
  $server_host                  = $::fqdn,
  $server_port                  = 443,
  $repo_enabled                 = false,

  $mail_enabled                 = false,
  $mail_host                    = 'localhost',
  $mail_host_port               = 25,
  $mail_from                    = 'no-reply@your.domain',

  $mongodb_database             = 'pulp_database',
  $mongodb_auth                 = true,
  $mongodb_username             = 'pulp',
  $mongodb_password             = 'pulp',
  $mongodb_repl_set             = 'replset0',
  $mongodb_seeds                = ['localhost'],
  $mongodb_manage               = true,

  $messaging_url                = 'tcp://localhost:5672',
  $broker_url                   = 'qpid://guest@localhost/',
  $migrate_attempts             = 3,
  $migrate_wait_secs            = 5,

  $enable_workers               = false,
  $enable_resource_manager      = false,
  $enable_celerybeat            = false,
  $server_packages              = $::pulp::params::server_packages,
  $httpd_servicename            = $::pulp::params::httpd_servicename,
  $workers_servicename          = $::pulp::params::workers_servicename,
  $resource_manager_servicename = $::pulp::params::resource_manager_servicename,
  $celerybeat_servicename       = $::pulp::params::celerybeat_servicename,
  $httpd_username               = $::pulp::params::httpd_username,
) inherits pulp::params {

  validate_string($default_login)
  validate_string($default_password)
  validate_string($server_host)
  if ! is_integer($server_port) {
    fail("pulp::server::server_port `${server_port}' is not an interger")
  }
  validate_bool($repo_enabled)

  validate_bool($mail_enabled)
  validate_string($mail_host)
  if ! is_integer($mail_host_port) {
    fail("pulp::server::mail_host_port `${mail_host_port}' is not an interger")
  }
  validate_string($mail_from)

  validate_string($mongodb_database)
  validate_bool($mongodb_auth)
  validate_string($mongodb_username)
  validate_string($mongodb_password)
  validate_string($mongodb_repl_set)
  validate_array($mongodb_seeds)
  validate_bool($mongodb_manage)

  validate_string($messaging_url)
  validate_string($broker_url)
  if ! is_integer($migrate_attempts) {
    fail("pulp::server::migrate_attempts `${migrate_attempts}' is not an interger")
  }
  if ! is_integer($migrate_wait_secs) {
    fail("pulp::server::migrate_wait_secs `${migrate_wait_secs}' is not an interger")
  }

  validate_bool($enable_workers)
  validate_bool($enable_resource_manager)
  validate_bool($enable_celerybeat)
  validate_array($server_packages)
  validate_string($httpd_servicename)
  validate_string($workers_servicename)
  validate_string($resource_manager_servicename)
  validate_string($celerybeat_servicename)
  validate_string($httpd_username)

  contain ::pulp::server::install
  contain ::pulp::server::postinstall
  contain ::pulp::server::config
  contain ::pulp::server::service

  Class["${name}::install"]
  -> Class["${name}::config"]
  -> Class["${name}::postinstall"]
  -> Class["${name}::service"]
}

