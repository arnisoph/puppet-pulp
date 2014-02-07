# == Class: pulp
#
# This module manages pulp
#
# === Parameters
#
# [*pulp_server_host*]
#   Hostname of pulp server.
#
# [*pulp_server_port*]
#   TCP/IP port of pulp server.
#
# [*repo_enabled*]
#   Enable installation of pulp and epel yum repositories. Use it for a quick start or if you're to lazy to manage them yourself.
#
# [*mail_enabled*]
#   Allow pulp to send outgoing email.
#
# [*mail_host*]
#   Hostname of email server.
#
# [*mail_host_port*]
#   Email server TCP/IP port.
#
# [*mail_from*]
#   From email address of pulp administrator.
#
# [*mongodb_host*]
#   MongoDB server hostname or ip address.
#
# [*mongodb_port*]
#   TCP/IP port for MongoDB host.
#
# [*qpid_server*]
#   Apache Qpid AMQP host.
#
# [*qpid_port*]
#   TCP/IP port for AMQP host.
#
# [*migrate_attempts*]
#   Number of attempts to execute pulp-manage-db successfully.
#
# [*migrate_wait_secs*]
#   Number of seconds to wait between pulp-manage-db attempts.
#
# [*default_login*]
#   Set default login account for pulp-admin.
#
# [*default_password*]
#   Set default password for for pulp-admin.
#
# === Examples
#
# class{"pulp": repo_enabled => true } ->
# class{"pulp::server": } ->
# class{"pulp::admin": } ->
# class{"pulp::client": }
#
# The last three ones are optional. If you set none of the latter three ones the base class installs the Pulp repo (file) only
#
# === Authors
#
# KrisBuytaert <kris.buytaert@inuits.be>
# Arnold Bechtoldt <arnold.bechtoldt@dm.de>
#
# === Copyright
#
# Copyright 2014 FILIADATA GmbH
#
class pulp (
  # Use params.pp or an ENC to overwrite the params
  $default_login      = $pulp::params::default_login,
  $default_password   = $pulp::params::default_password,
  $pulp_server_host   = $pulp::params::pulp_server_host,
  $pulp_server_port   = $pulp::params::pulp_server_port,
  $repo_enabled       = $pulp::params::repo_enabled,
  $mail_enabled       = $pulp::params::mail_enabled,
  $mail_host          = $pulp::params::mail_host,
  $mail_host_port     = $pulp::params::mail_host_port,
  $mail_from          = $pulp::params::mail_from,
  $mongodb_srv_enable = $pulp::params::mongodb_srv_enable,
  $mongodb_host       = $pulp::params::mongodb_host,
  $mongodb_port       = $pulp::params::mongodb_port,
  $qpid_srv_enable    = $pulp::params::qpid_srv_enable,
  $qpid_server        = $pulp::params::qpid_server,
  $qpid_port          = $pulp::params::qpid_port,
  $migrate_attempts   = $pulp::params::migrate_attempts,
  $migrate_wait_secs  = $pulp::params::migrate_wait_secs,
  $httpd_srv_enable   = $pulp::params::httpd_srv_enable
) inherits pulp::params {
  validate_string($default_login)
  validate_string($default_password)
  validate_string($pulp_server_host)
  validate_string($pulp_server_port)
  validate_bool($repo_enabled)
  validate_bool($mail_enabled)
  validate_string($mail_host)
  validate_string($mail_host_port)
  validate_string($mail_from)
  validate_bool($mongodb_srv_enable)
  validate_string($mongodb_host)
  validate_string($mongodb_port)
  validate_bool($qpid_srv_enable)
  validate_string($qpid_server)
  validate_string($qpid_port)
  validate_string($migrate_attempts)
  validate_string($migrate_wait_secs)
  validate_bool($httpd_srv_enable)

  if $pulp::repo_enabled {
    class {'pulp::repo': }
  }
}
