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
}
