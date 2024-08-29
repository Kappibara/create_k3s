#!/bin/bash

NODES=("node1" "node2" "node3")
INVENTORY="inventory.ini"

echo "[k3s_nodes]" > $INVENTORY

for NODE in "${NODES[@]}"; do
  IP_ADDRESSES=$(vagrant ssh $NODE -c "hostname -I" | tr -d '\r')
  IP=$(echo $IP_ADDRESSES | awk '{for(i=1;i<=NF;i++) if ($i ~ /^192\.168\.0\./) print $i}' | head -n 1)

  echo "$NODE ansible_host=$IP" >> $INVENTORY
done