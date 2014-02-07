# == Class: pulp::repo
#
# Installs the Pulp repo
#
# === Parameters
#
# === Examples
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
class pulp::repo {
  yumrepo {'pulp-v2-stable':
    descr    => 'Pulp Community Releases',
    baseurl  => 'http://repos.fedorapeople.org/repos/pulp/pulp/v2/stable/$releasever/$basearch/',
    enabled  => '1',
    gpgcheck => '0',
  }
  ->
  yumrepo {'epel':
    descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
    mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled        => '1',
    failovermethod => 'priority',
    gpgcheck       => '1',
  }
}
