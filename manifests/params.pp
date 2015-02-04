# == Class: pulp::params
#
class pulp::params {

  #TODO check whether packages are missing in the arrays below

  case $::operatingsystem {
    centos, redhat: {
      $server_packages = ['pulp-server', 'pulp-puppet-plugins', 'pulp-rpm-plugins', 'pulp-selinux']
      $admin_packages = ['pulp-admin-client', 'pulp-puppet-admin-extensions', 'pulp-rpm-admin-extensions']
      $consumer_packages = ['pulp-agent', 'pulp-consumer-client', 'pulp-puppet-consumer-extensions', 'pulp-puppet-handlers', 'pulp-rpm-consumer-extensions', 'pulp-rpm-handlers', 'pulp-rpm-yumplugins']
      $consumer_servicename = 'pulp-agent'
      $httpd_servicename = 'httpd'
      $workers_servicename = 'pulp_workers'
      $resource_manager_servicename = 'pulp_resource_manager'
      $celerybeat_servicename = 'pulp_celerybeat'
      $httpd_username = 'apache'
    }
    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }

  if $::pulp::servers::enable_workers {
    $ensure_workers = 'running'
  } else {
    $ensure_workers = 'stopped'
  }

  if $::pulp::servers::enable_resource_manager {
    $ensure_resource_manager = 'running'
  } else {
    $ensure_resource_manager = 'stopped'
  }

  if $::pulp::servers::enable_celerybeat {
    $ensure_celerybeat = 'running'
  } else {
    $ensure_celerybeat = 'stopped'
  }



}
