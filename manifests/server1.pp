class server1 {

  include basic_java

  class { "neo4j::install":
    ha_server_id => 1
  }
}

include server1
