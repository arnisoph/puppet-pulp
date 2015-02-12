# Puppet Module for Pulp

Pulp is a platform for managing repositories of content, such as software packages and pushing that content out to large numbers of consumers.

## TODO

* Improve schedule plans
* create a *native* Pulp API integration to manage repositories, schedule plans and more

## Usage

Don't forget to set appropriate parameters.

### Pulp Server

```puppet
class {'pulp::server': }
```

### Pulp Consumer

```puppet
class {'pulp::consumer': }
```

### Pulp Admin

```puppet
class {'pulp::admin': }
```
