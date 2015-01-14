# == Class: pulp::server::install
#
class pulp::server::install {

  package {$::pulp::server::server_packages: }
}
