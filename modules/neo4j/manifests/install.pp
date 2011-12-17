class neo4j {
  class install {
    
    $ha_server_id = 1
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
        command => 'tar xzf /host_mount/neo4j-enterprise-1.6.M02-unix.tar.gz',
        path => ['/bin', '/usr/bin']
    }
    
    file {
      "$neo4j_home/conf/neo4j.properties":
        ensure => file,
        content => template("neo4j/neo4j.properties.erb"),
        before => Exec['extract tarball']
    }
  }
}
