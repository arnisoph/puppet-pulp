# == Class: pulp::consumer::config
#
class pulp::consumer::config {

  file {'/etc/pulp/consumer/consumer.conf':
    ensure  => present,
    content => template('pulp/consumer.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
