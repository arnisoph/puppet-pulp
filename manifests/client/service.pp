# == Class: pulp::client::service
#
# This class starts the services for pulp::client
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Arnold Bechtoldt <arnold.bechtoldt@dm.de>
#
# === Copyright
#
# see LICENSE
#
class pulp::client::service {
  service { 'pulpagent_service':
    ensure  => 'running',
    name    => $pulp::pulpagent_servicename,
    enable  => true,
  }
}
