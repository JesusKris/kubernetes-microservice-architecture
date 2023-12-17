# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vagrant.plugins = ["vagrant-env"]
  config.env.enable
  config.vm.box = ENV['VAGRANT_BOX']

  config.vm.define "master" do |master| 

    master.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end

    master.vm.box = ENV['VAGRANT_BOX']

    master.vm.hostname = "master"

    master.vm.synced_folder "./token", "/vagrant_shared"

    master.vm.network "private_network", ip: ENV['MASTER_PRIVATE_NET_IP']

    master.vm.provision "shell", path: "./scripts/setup_master.sh", args: [ENV['MASTER_PRIVATE_NET_IP']]
  end


  config.vm.define "agent" do |agent| 

    agent.vm.box = ENV['VAGRANT_BOX']
  
    agent.vm.hostname = "agent"

    agent.vm.synced_folder "./token", "/vagrant_shared"
  
    agent.vm.network "private_network", ip: ENV['AGENT_PRIVATE_NET_IP']

    agent.vm.provision "shell", path: "./scripts/setup_agent.sh", args: [ENV['MASTER_PRIVATE_NET_IP'], ENV['AGENT_PRIVATE_NET_IP']]

  end

end
