# == Class: pulp::admin::config
#
# This class implements the configuration of the pulp admin client
#
# === Parameters
#
# === Examples
#
# === Authors
#
# KrisBuytaert <kris.buytaert@inuits.be>
# Arnold Bechtoldt <arnold.bechtoldt@dm.de>
#
# === Copyright
#
# see LICENSE
#
class pulp::admin::config {
  file {'/etc/pulp/admin/admin.conf':
    content => template('pulp/etc/pulp/admin/admin.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
