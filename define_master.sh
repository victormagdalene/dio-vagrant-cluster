#!/bin/bash

# Espera até que o IP esteja disponível
while ! ip a | grep -q "192.168.56.10"; do
  echo "Aguardando a interface de rede estar pronta..."
  sleep 10
done

sudo docker swarm init --advertise-addr=192.168.56.10
sudo docker swarm join-token worker | grep docker > /vagrant/add_worker.sh