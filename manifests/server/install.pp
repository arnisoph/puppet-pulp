# == Class: pulp::server::install
#
# This class implements the installation of the pulp server
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
class pulp::server::install {
  package {$pulp::server_packages: }
}
