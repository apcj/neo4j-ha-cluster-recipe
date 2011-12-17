class server2 {

  include basic_java

  class { "neo4j::install":
    ha_server_id => 2
  }
}

include server2
