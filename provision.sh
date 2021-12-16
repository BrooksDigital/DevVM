#!/bin/bash

# General ssh global config for vagrant user
cp -R /tmp/host/.ssh/* /home/vagrant/.ssh
cp /vagrant/ssh/config /home/vagrant/.ssh/config
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 400 /home/vagrant/.ssh/config

# vscode-server settings
cp -R /vagrant/vscode-server /home/vagrant/.vscode-server
chown -R vagrant:vagrant /home/vagrant/.vscode-server

# General tools
apt-get update
apt-get install -y git jq htop net-tools

# Docker setup based of https://docs.docker.com/engine/install/debian/
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Add vagrant to the docker group so it can be used by the user
usermod -a -G docker vagrant

# lando
LANDO_VERSION=3.6.0
wget -q https://github.com/lando/lando/releases/download/v$LANDO_VERSION/lando-x64-v$LANDO_VERSION.deb
dpkg -i lando-x64-v$LANDO_VERSION.deb
rm lando-x64-v$LANDO_VERSION.deb

