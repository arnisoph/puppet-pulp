# == Class: pulp::admin::install
#
class pulp::admin::install {

  package {$::pulp::admin::admin_packages: }
}
