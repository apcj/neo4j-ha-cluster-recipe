class neo4j {
  class install ($ha_server_id) {
    
    $ha_server_ip_address = "192.168.1.10$ha_server_id"
    
    $neo4j_user = "vagrant"
    $user_home = "/home/vagrant"
    $downloads = "$user_home/downloads"
    $distribution = "neo4j-enterprise-1.6.1"
    $neo4j_home = "$user_home/$distribution"
    
    file {
      "$downloads":
        ensure => directory,
        owner => $neo4j_user
    }
    
    exec {
      'download tarball':
        cwd => $downloads,
        user => $neo4j_user,
        creates => "$downloads/$distribution-unix.tar.gz",
        command => "wget http://dist.neo4j.org/$distribution-unix.tar.gz",
        path => ['/bin', '/usr/bin']
    }
    
    exec {
      'extract tarball':
        cwd => $user_home,
        creates => $neo4j_home,
        user => $neo4j_user,
        command => "tar xzf $downloads/$distribution-unix.tar.gz",
        path => ['/bin', '/usr/bin'],
        require => Exec['download tarball']
    }
    
    file {
      "$neo4j_home/data/coordinator/myid":
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
  }
}
