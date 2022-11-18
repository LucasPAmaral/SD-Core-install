#!/bin/bash

echo "This is our foreplay"
echo "We shall assure some tools are already installed beforehand"
echo "- most are installed using apt"
echo "Some tools require enabling theyr own repositories, such as kubernetes"
echo "---------------------------------------"
echo "UPDATING-------------------------------"
sudo apt update
echo "UPGRADING------------------------------"
sudo apt upgrade
echo "ADDING DOCKER REPOSITORIES-------------"
sudo apt-get install ca-certificates curl gnupg lsb-release curl
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

exec echo /
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
echo "INSTALLING DOCKER PACKAGES-----------"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "TESTING DOCKER INSTALLATION----------"
sudo docker run hello-world


