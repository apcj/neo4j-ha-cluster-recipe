Vagrant::Config.run do |config|

  config.vm.define :server1 do |server1_config|
    server1_config.vm.box = "lucid64"
    server1_config.vm.network "192.168.1.101"
    server1_config.vm.forward_port "http", 7474, 7001
    server1_config.vm.forward_port "jmx", 3637, 3637
    server1_config.vm.share_folder "v-data", "/host_mount", "data_for_vms"

    server1_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file = "neo4j-ha-server.pp"
    end
  end

  # config.vm.define :server2 do |server2_config|
  #   server2_config.vm.box = "lucid64"
  #   server2_config.vm.network "192.168.1.102"
  #   server2_config.vm.forward_port "http", 7474, 7002
  #   server2_config.vm.share_folder "v-data", "/host_mount", "data_for_vms"
  # 
  #   server2_config.vm.provision :puppet do |puppet|
  #     puppet.manifests_path = "manifests"
  #     puppet.manifest_file = "lucid64.pp"
  #   end
  # end
  # 
  # config.vm.define :server3 do |server3_config|
  #   server3_config.vm.box = "lucid64"
  #   server3_config.vm.network "192.168.1.103"
  #   server3_config.vm.forward_port "http", 7474, 7003
  #   server3_config.vm.share_folder "v-data", "/host_mount", "data_for_vms"
  # 
  #   server3_config.vm.provision :puppet do |puppet|
  #     puppet.manifests_path = "manifests"
  #     puppet.manifest_file = "lucid64.pp"
  #   end
  # end
  
end
