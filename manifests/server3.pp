class server3 {

  include basic_java

  class { "neo4j::install":
    ha_server_id => 3
  }
}

include server3
