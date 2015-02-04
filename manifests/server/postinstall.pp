# == Class: pulp::server::postinstall
#
class pulp::server::postinstall {

  if $::pulp::server::mongodb_manage {
    exec {'manage_pulp_databases':
      command   => '/usr/bin/pulp-manage-db && touch /var/lib/pulp/.puppet-pulp-manage-db',
      user      => $::pulp::server::httpd_username,
      logoutput => true,
      tries     => $::pulp::server::migrate_attempts,
      try_sleep => $::pulp::server::migrate_wait_secs,
      creates   => '/var/lib/pulp/.puppet-pulp-manage-db'
    }
  }
}
