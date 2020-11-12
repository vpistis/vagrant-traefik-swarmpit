#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io fish
sudo apt-get -y upgrade
sudo usermod -aG docker vagrant
sudo service docker start
docker version
