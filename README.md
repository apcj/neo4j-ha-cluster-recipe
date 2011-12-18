# Neo4j HA Cluster Recipe

### Current features

* Automated configuration of a cluster of Neo4j servers
* Runs on locally hosted VMs using Vagrant over VirtualBox
* Configuration using Puppet
* Useful for basic testing

### Potential future features

* Ability to provision VMs in a real cloud such as AWS
* Use Chef instead of or as an alternative to Puppet
* Better generation of configuration to account for a variable number of servers in the cluster
* Better modularisation of configuration so useful parts could be packaged and used for production deployments

## Instructions

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. `gem install vagrant`
3. `vagrant box add lucid64 http://files.vagrantup.com/lucid64.box`
4. `git clone git://github.com/apcj/neo4j-ha-cluster-recipe.git && cd neo4j-ha-cluster-recipe`
5. `vagrant up`
6. `vagrant provision`

Step 6 should not be required, because `vagrant up` does a `provision` itself.  However, you will notice that the neo4j process on the first server will fail to start during `vagrant up`.  This is because zookeeper isn't able to contact any of the other hosts in the roster at the time the first server starts.  This is something we can hopefully fix soon.  In any case, the problem is quickly resolved with a quick `vagrant provision`, which finds what's missing and starts the missing process on just server1.

