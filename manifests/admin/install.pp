# == Class: pulp::adminclient::install
#
# This class implements the installation of the pulp admin client
#
# === Parameters
#
# === Examples
#
# === Authors
#
# Arnold Bechtoldt <arnold.bechtoldt@dm.de>
# KrisBuytaert <kris.buytaert@inuits.be>
#
# === Copyright
#
# see LICENSE
#
class pulp::admin::install {
  package {$pulp::admin_packages: }
}
