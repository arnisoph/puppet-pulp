# == Class: pulp::consumer::install
#
class pulp::consumer::install {

  package {$::pulp::consumer::consumer_packages: }
}
