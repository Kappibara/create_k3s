Vagrant.configure("2") do |config|
  config.vm.network "public_network", bridge: "wlp0s20f3"

  config.vm.provision "ansible" do |ansible|
      ansible.playbook = 'ansible/playbook.yaml'
      ansible.inventory_path = "ansible/inventory.ini"
      ansible.limit = "master"
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "ubuntu/jammy64"
    node1.vm.hostname = "master"
    node1.vm.network "public_network", ip: "192.168.0.101", bridge: "wlp0s20f3"
    node1.vm.provider "virtualbox" do |vb|
      vb.name = "masterNode"
    end
  end

#   config.vm.define "node2" do |node2|
#     node2.vm.box = "ubuntu/jammy64"
#     node2.vm.hostname = "slave1"
#     node2.vm.network "public_network", ip: "192.168.0.102", bridge: "wlp0s20f3"
#     node2.vm.provider "virtualbox" do |vb|
#       vb.name = "slaveNode1"
#     end
#   end
#
#   config.vm.define "node3" do |node3|
#     node3.vm.box = "ubuntu/jammy64"
#     node3.vm.hostname = "slave2"
#     node3.vm.network "public_network", ip: "192.168.0.104", bridge: "wlp0s20f3"
#     node3.vm.provider "virtualbox" do |vb|
#       vb.name = "slaveNode2"
#     end
#   end
end
