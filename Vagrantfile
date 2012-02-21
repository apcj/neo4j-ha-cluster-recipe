Vagrant::Config.run do |config|

  config.vm.define :server1 do |server|
    server.vm.box = "ubuntu-lucid-64"
    server.vm.network :hostonly, "192.168.1.101"
    server.vm.forward_port 7474, 7001
    server.vm.host_name = 'server1.sandbox.neo4j.org'

    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "site.pp"
    end
  end

  config.vm.define :server2 do |server|
    server.vm.box = "ubuntu-lucid-64"
    server.vm.network :hostonly, "192.168.1.102"
    server.vm.forward_port 7474, 7002
    server.vm.host_name = 'server2.sandbox.neo4j.org'
  
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "site.pp"
    end
  end
  
  config.vm.define :server3 do |server|
    server.vm.box = "ubuntu-lucid-64"
    server.vm.network :hostonly, "192.168.1.103"
    server.vm.forward_port 7474, 7003
    server.vm.host_name = 'server3.sandbox.neo4j.org'
  
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "site.pp"
    end
  end
  
end
