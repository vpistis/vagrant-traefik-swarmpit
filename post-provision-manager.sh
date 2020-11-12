#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "Deploy Traefik cluster..."
docker stack deploy -c docker-compose.yml traefik

echo "Deploy Swarmpit cluster..."
git clone https://github.com/swarmpit/swarmpit -b master
docker stack deploy -c swarmpit/docker-compose.yml swarmpit








