# == Class: pulp::prerequisites
#
class pulp::prerequisites {

  #TODO make this configureable?
  yumrepo {'pulp-v2-stable':
    descr    => 'Pulp Community Releases',
    baseurl  => 'https://repos.fedorapeople.org/repos/pulp/pulp/stable/2/$releasever/$basearch/',
    enabled  => '1',
    gpgcheck => '0',
  }

  yumrepo {'epel':
    descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
    mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch/',
    enabled        => '1',
    failovermethod => 'priority',
    gpgcheck       => '1',
  }
}
