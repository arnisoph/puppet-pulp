# == Class: pulp::server
#
# This module manages pulp server
#
# === Parameters
#
# == Examples
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
class pulp::server {

  anchor{"${name}::begin": }
  ->
  class {"${name}::install": }
  ~>
  class {"${name}::postinstall": }
  ->
  class {"${name}::config": }
  ->
  class {"${name}::service": }
  ->
  anchor{"${name}::end": }
}
