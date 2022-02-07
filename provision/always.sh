#!/bin/bash

# Copy over specifc etc files
cp -R /vagrant/etc/* /etc

# Keeping the VM up to date
for i in 1 2 3 4 5; do apt-get update -y && break ; done
for i in 1 2 3 4 5; do apt-get upgrade -y && break ; done

# General ssh global config for vagrant user
cp -R /tmp/host/.ssh/* /home/vagrant/.ssh
cp /vagrant/ssh/config /home/vagrant/.ssh/config
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 400 /home/vagrant/.ssh/config

# vscode-server settings
cp -R /vagrant/vscode-server /home/vagrant/.vscode-server
chown -R vagrant:vagrant /home/vagrant/.vscode-server
