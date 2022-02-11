#!/bin/bash

echo "Copy over specifc etc files..."
cp -R /vagrant/etc/* /etc

echo "Enable utf en_US locale..."
sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

echo "Restart/apply config files copied above..."
sysctl --system

echo "Apt update..."
for i in 1 2 3 4 5; do apt-get update -y && break ; done
echo "Apt install general tools..."
for i in 1 2 3 4 5; do apt-get install -y git jq htop net-tools && break ; done

# Docker setup based of https://docs.docker.com/engine/install/debian/
echo "Apt install more tools..."
for i in 1 2 3 4 5; do apt-get install -y ca-certificates curl gnupg lsb-release && break ; done
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Apt update..."
for i in 1 2 3 4 5; do apt-get update -y && break ; done
echo "Apt install docker..."
for i in 1 2 3 4 5; do apt-get install -y docker-ce docker-ce-cli containerd.io && break ; done

echo "Add vagrant to the docker group so it can be used by the user..."
usermod -a -G docker vagrant

echo "Install lando..."
LANDO_VERSION=3.6.0
wget -q https://github.com/lando/lando/releases/download/v$LANDO_VERSION/lando-x64-v$LANDO_VERSION.deb
dpkg -i lando-x64-v$LANDO_VERSION.deb
rm lando-x64-v$LANDO_VERSION.deb
