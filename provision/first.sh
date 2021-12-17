#!/bin/bash

# Copy over specifc etc files
cp -R /vagrant/etc/* /etc

# Enable utf en_US locale
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# Restart/apply config files copied above
sysctl --system

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
