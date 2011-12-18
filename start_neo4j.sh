#!/bin/bash
echo "cd neo4j-enterprise-1.6.M02; bin/neo4j start" | vagrant ssh server1
echo "cd neo4j-enterprise-1.6.M02; bin/neo4j start" | vagrant ssh server2
echo "cd neo4j-enterprise-1.6.M02; bin/neo4j start" | vagrant ssh server3