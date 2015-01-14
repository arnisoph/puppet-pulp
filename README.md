# Puppet Module for Pulp

Pulp is a platform for managing repositories of content, such as software packages and pushing that content out to large numbers of consumers.

This puppet module is for installing + configuring Pulp and is based on [KrisBuytaert / puppet-pulp](https://github.com/KrisBuytaert/puppet-pulp).

## TODO

* Improve schedule plans

## Usage

pulp server:
```puppet
class {'pulp::server': }
```

pulp consumer:
```puppet
class {'pulp::consumer': }
```

pulp admin:
```puppet
class {'pulp::admin': }
```
