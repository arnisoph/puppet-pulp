# == Class: pulp::server::config
#
# This class implements the configuration of the pulp server client
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
class pulp::server::config {
  file {'/etc/pulp/server.conf':
    content => template('pulp/etc/pulp/server.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644', #TODO SECURITY ISSUE?!
    notify  => Service[$pulp::httpd_servicename],
  }
}
