# Basic Puppet manifests

class neo4j-ha-server {

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
  }
      
  package { "openjdk-6-jdk":
    ensure => present,
  }

  group { "puppet": 
    ensure => "present", 
  }

  include neo4j::install
}

include neo4j-ha-server
