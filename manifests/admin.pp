# == Class: pulp::adminclient
#
# This class implements the management of the pulp admin client (API client)
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
class pulp::admin {

  anchor {"${name}::begin": }
  ->
  class {"${name}::install": }
  ->
  class {"${name}::config": }
  ->
  anchor {"${name}::end": }
}
