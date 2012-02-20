#!/bin/bash

function exec_all_servers {
  for i in 1 2 3; do
    # command=$@
    # echo $command
    vagrant ssh server$i -c $@
  done;
}

# exec_all_servers "neo4j-enterprise-1.6.1/bin/neo4j-coordinator start"
# exec_all_servers "neo4j-enterprise-1.6.1/bin/neo4j start"

exec_all_servers "neo4j-enterprise-1.6.1/bin/neo4j stop"
exec_all_servers "neo4j-enterprise-1.6.1/bin/neo4j-coordinator stop"
