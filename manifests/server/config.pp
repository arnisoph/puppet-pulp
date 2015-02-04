# == Class: pulp::server::config
#
class pulp::server::config {

  file {'/etc/pulp/server.conf':
    content => template('pulp/server.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$::pulp::server::httpd_servicename],
  }

  file {'/etc/default/pulp_workers':
    content => template('pulp/default/pulp_workers.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$::pulp::server::workers_servicename],
  }

  file {'/etc/default/pulp_resource_manager':
    content => template('pulp/default/pulp_resource_manager.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$::pulp::server::resource_manager_servicename],
  }

  file {'/etc/default/pulp_celerybeat':
    content => template('pulp/default/pulp_celerybeat.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$::pulp::server::celerybeat_servicename],
  }
}
