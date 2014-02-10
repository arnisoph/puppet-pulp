# Puppet Module for Pulp

Pulp is a platform for managing repositories of content, such as software packages and pushing that content out to large numbers of consumers.

This puppet module is for installing + configuring Pulp and is based on [KrisBuytaert / puppet-pulp](https://github.com/KrisBuytaert/puppet-pulp).

## TODO

* Improve schedule plans
* Improve pulp::server::postinstall

## Usage


pulp server:
```puppet
class {'pulp': repo_enabled => true, } -> class{'pulp::server': }
```

pulp client/agent:
```puppet
class {'pulp': repo_enabled => true, } -> class{'pulp::client': }
```

pulp admin tool:
```puppet
class {'pulp': repo_enabled => true, } -> class{'pulp::admin': }
```

All components with the pulp project yum repository enabled:
```puppet
class {'pulp':
  repo_enabled => true,
}
->

class {'pulp::server':
}
->

class {'pulp::admin':
}
->

class {'pulp::client':
}
```
