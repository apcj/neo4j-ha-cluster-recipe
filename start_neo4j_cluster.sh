#!/bin/bash
set -x
NEO_DIR='neo4j-enterprise-1.6.1'
function exec_all_servers {
  for i in 1 2 3; do
    vagrant ssh server$i -c "$@"
  done;
}

for command in "${NEO_DIR}/bin/neo4j-coordinator start" "${NEO_DIR}/bin/neo4j start"; do
  exec_all_servers "$command"
done