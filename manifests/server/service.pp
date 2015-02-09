# == Class: pulp::server::service
#
class pulp::server::service {

  if $::pulp::server::enable_workers {
    $ensure_workers = 'running'
  } else {
    $ensure_workers = 'stopped'
  }

  if $::pulp::server::enable_resource_manager {
    $ensure_resource_manager = 'running'
  } else {
    $ensure_resource_manager = 'stopped'
  }

  if $::pulp::server::enable_celerybeat {
    $ensure_celerybeat = 'running'
  } else {
    $ensure_celerybeat = 'stopped'
  }

  service { $::pulp::server::workers_servicename:
    ensure     => $ensure_workers,
    enable     => $::pulp::server::enable_workers,
    hasrestart => true,
  }

  service { $::pulp::server::resource_manager_servicename:
    ensure     => $ensure_resource_manager,
    enable     => $::pulp::server::enable_resource_manager,
    hasrestart => true,
  }

  service { $::pulp::server::celerybeat_servicename:
    ensure     => $ensure_celerybeat,
    enable     => $::pulp::server::enable_celerybeat,
    hasrestart => true,
  }
}
