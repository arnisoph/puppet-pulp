# == Class: pulp::client::config
#
# This class implements the configuratiom of the pulp consumer
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
class pulp::client::config {
  file {'/etc/pulp/consumer/consumer.conf':
    content => template('pulp/etc/pulp/consumer/consumer.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
