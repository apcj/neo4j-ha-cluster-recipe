class java::openjdk {

  # by happy co-incidence this happens to be the name
  # of our official puppet module to install openjdk
  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
  }

  package { 'openjdk-6-jdk':
    ensure => present,
    before => Exec['apt-update']
  }

  group { 'puppet':
    ensure => 'present',
  }
}
