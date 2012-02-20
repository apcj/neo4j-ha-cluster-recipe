Vagrant::Config.run do |config|

  config.vm.define :server1 do |server|
    server.vm.box = "lucid64"
    server.vm.network :hostonly, "192.168.1.101"
    server.vm.forward_port 7474, 7001

    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "server1.pp"
    end
  end

  config.vm.define :server2 do |server|
    server.vm.box = "lucid64"
    server.vm.network :hostonly, "192.168.1.102"
    server.vm.forward_port 7474, 7002
  
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "server2.pp"
    end
  end
  
  config.vm.define :server3 do |server|
    server.vm.box = "lucid64"
    server.vm.network :hostonly, "192.168.1.103"
    server.vm.forward_port 7474, 7003
  
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "server3.pp"
    end
  end
  
end
