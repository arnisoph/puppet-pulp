# == Class: pulp::client
#
# This class implements the management of the pulp consumer
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
class pulp::client {

  anchor {"${name}::begin": }
  ->
  class {"${name}::install": }
  ->
  class {"${name}::config": }
  ->
  class {"${name}::service": }
  ->
  anchor {"${name}::end": }
}
