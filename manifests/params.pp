# == Class: pulp::params
#
# This class defines default values for pulp base class parameters
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
class pulp::params {
  case $::operatingsystem {
    centos, redhat: { #TODO add EOL + Amazon Linux
    $server_packages = ['pulp-server', 'pulp-puppet-plugins', 'pulp-rpm-plugins', 'pulp-selinux']
    $admin_packages = ['pulp-admin-client', 'pulp-puppet-admin-extensions', 'pulp-rpm-admin-extensions']
    $client_packages = ['pulp-agent', 'pulp-consumer-client', 'pulp-puppet-consumer-extensions', 'pulp-puppet-handlers', 'pulp-rpm-consumer-extensions', 'pulp-rpm-handlers', 'pulp-rpm-yumplugins']

    $qpid_servicename = 'qpidd'
    $mongodb_servicename = 'mongod'
    $httpd_servicename = 'httpd'
    $pulpagent_servicename = 'pulp-agent'
    }
    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }

  $default_login      = 'admin'
  $default_password   = 'admin'
  $pulp_server_host   = $::hostname
  $pulp_server_port   = '443'
  $repo_enabled       = false
  $mail_enabled       = false
  $mail_host          = 'localhost'
  $mail_host_port     = '25'
  $mail_from          = 'no-reply@your.domain'
  $mongodb_srv_enable = true
  $mongodb_host       = 'localhost'
  $mongodb_port       = '27017'
  $qpid_srv_enable    = true
  $qpid_server        = 'localhost'
  $qpid_port          = '5672'
  $migrate_attempts   = '3'
  $migrate_wait_secs  = '5'
  $httpd_srv_enable   = true
}
