# == Class: pulp::admin::config
#
class pulp::admin::config {

  file {'/etc/pulp/admin/admin.conf':
    content => template('pulp/admin.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
