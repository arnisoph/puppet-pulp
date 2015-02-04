# == Class: pulp::server::service
#
class pulp::server::service {

  if $::pulp::server::ensure_workers == 'running' {
    $enable_workers = true
  } else {
    $enable_workers = false
  }

  if $::pulp::server::ensure_resource_manager == 'running' {
    $enable_resource_manager = true
  } else {
    $enable_resource_manager = false
  }

  if $::pulp::server::ensure_celerybeat == 'running' {
    $enable_celerybeat = true
  } else {
    $enable_celerybeat = false
  }

  service { $::pulp::server::workers_servicename:
    ensure     => $::pulp::server::ensure_workers,
    enable     => $enable_workers,
    hasrestart => true,
  }

  service { $::pulp::server::resource_manager_servicename:
    ensure     => $::pulp::server::ensure_resource_manager,
    enable     => $enable_resource_manager,
    hasrestart => true,
  }

  service { $::pulp::server::celerybeat_servicename:
    ensure     => $::pulp::server::ensure_celerybeat,
    enable     => $enable_celerybeat,
    hasrestart => true,
  }
}
