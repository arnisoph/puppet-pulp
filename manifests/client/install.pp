# == Class: pulp::client::install
#
# This class implements the installation of the pulp consumer
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
class pulp::client::install {
  package {'client_packages':
    name => $pulp::client_packages,
  }
}
