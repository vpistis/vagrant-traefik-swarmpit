#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "Deploy Traefik cluster..."
git clone https://6d62593bbf2685949cd2de089cd3375f1f3a1d66@github.com/vpistis/vagrant-traefik-swarmpit.git
docker network create public
docker stack deploy -c vagrant-traefik-swarmpit/docker-compose.yml traefik

echo "Deploy Swarmpit cluster..."
git clone https://github.com/swarmpit/swarmpit -b master
docker stack deploy -c swarmpit/docker-compose.yml swarmpit








