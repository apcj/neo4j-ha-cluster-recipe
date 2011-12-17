class basic_java {

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
  }
      
  package { "openjdk-6-jdk":
    ensure => present,
  }

  group { "puppet": 
    ensure => "present", 
  }
}
