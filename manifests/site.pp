node server1 {
    class { 'neo4j::install':
    ha_server_id => 1
  }
}
node server2 {
    class { 'neo4j::install':
    ha_server_id => 2
  }
}

node server3 {
    class { 'neo4j::install':
    ha_server_id => 3
  }
}