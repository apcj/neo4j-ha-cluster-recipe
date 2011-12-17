class neo4j {
  class install {
    
    $ha_server_id = 1
    
    $neo4j_user = "vagrant"
    $user_home = "/home/vagrant"
    $neo4j_home = "$user_home/neo4j-enterprise-1.6.M02"
    
    file {
      '/home/vagrant':
        ensure => directory
    }
    
    exec {
      'extract tarball':
        cwd => $user_home,
        creates => $neo4j_home,
        user => $neo4j_user,
        command => 'tar xzf /host_mount/neo4j-enterprise-1.6.M02-unix.tar.gz',
        path => ['/bin', '/usr/bin']
    }
    
    file {
      "$neo4j_home/conf/myid":
        ensure => file,
        owner => $neo4j_user,
        content => $ha_server_id,
        require => Exec['extract tarball']
    }

    file {
      "$neo4j_home/conf/coord.cfg":
        ensure => file,
        owner => $neo4j_user,
        content => template("neo4j/coord.cfg.erb"),
        require => Exec['extract tarball']
    }

    file {
      "$neo4j_home/conf/neo4j.properties":
        ensure => file,
        owner => $neo4j_user,
        content => template("neo4j/neo4j.properties.erb"),
        require => Exec['extract tarball']
    }
    
    file {
      "$neo4j_home/conf/neo4j-server.properties":
        ensure => file,
        owner => $neo4j_user,
        content => template("neo4j/neo4j-server.properties.erb"),
        require => Exec['extract tarball']
    }

    exec {
      "start coordinator":
        cwd => "$neo4j_home",
        command => "$neo4j_home/bin/neo4j-coordinator start",
        unless => "/usr/bin/test -e $neo4j_home/data/neo4j-coord.pid",
        user => $neo4j_user,
        logoutput => true,
        require => Exec['extract tarball']
    }
  }
}
