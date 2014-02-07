# == Class: pulp::server::install
#
# Handles server post-install tasks
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Arnold Bechtoldt <arnold.bechtoldt@dm.de>
# KrisBuytaert <kris.buytaert@inuits.be>
#
# === Copyright
#
# see LICENSE
#
class pulp::server::postinstall {
  # Puppet is kinda stupid, we have to stop a service manually before executing a specific command because
  # the service resource is already defined in pulp::server::server. Hit me for a better solution.
  # If we plan to change the config of mongodb and/or httpd, this may need to be done before the following exec resource
  exec {'manage_pulp_databases':
    command     => "service ${pulp::mongodb_servicename} start && service ${pulp::httpd_servicename} stop && /usr/bin/pulp-manage-db",
    unless      => '/usr/bin/pulp-manage-db --test',
    path        => '/sbin:/usr/sbin:/bin:/usr/bin',
    refreshonly => true,
    logoutput   => true,
    tries       => $pulp::migrate_attempts,
    try_sleep   => $pulp::migrate_wait_secs,
  }
}
