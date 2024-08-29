#!/bin/bash

# Получаем имя сетевого адаптера
#ADAPTER=$(nmcli -t -f DEVICE,STATE d | grep ":connected" | awk -F: '{print $1}' | head -n 1)
ADAPTER=$(ip link show | awk -F: '/state UP/ {print $2}' | head -n 1 | tr -d ' ')

# Проверяем, что адаптер найден
if [ -z "$ADAPTER" ]; then
  echo "Network adapter not found!"
  exit 1
fi

# Генерируем Vagrantfile с найденным адаптером
cat <<EOF > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.network "public_network", bridge: "$ADAPTER"

  config.vm.define "node1" do |node1|
    node1.vm.box = "debian/buster64"
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "debian/buster64"
  end

  config.vm.define "node3" do |node3|
    node3.vm.box = "debian/buster64"
  end
end
EOF

echo "Vagrantfile created with adapter: $ADAPTER"

vagrant up