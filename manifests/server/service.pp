# == Class: pulp::server::service
#
# This class sets the desired states for the installed services
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
class pulp::server::service {
  service { 'qpid_service':
    ensure  => 'running',
    name    => $pulp::qpid_servicename,
    enable  => $pulp::qpid_srv_enable,
  }
  ->
  service { 'mongodb_service':
    ensure  => 'running',
    name    => $pulp::mongodb_servicename,
    enable  => $pulp::mongodb_srv_enable,
  }
  ->
  service { 'httpd_service':
    ensure  => 'running',
    name    => $pulp::httpd_servicename,
    enable  => $pulp::httpd_srv_enable,
  }
}
