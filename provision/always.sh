#!/bin/bash

# General ssh global config for vagrant user
cp -R /tmp/host/.ssh/* /home/vagrant/.ssh
cp /vagrant/ssh/config /home/vagrant/.ssh/config
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 400 /home/vagrant/.ssh/config

# vscode-server settings
cp -R /vagrant/vscode-server /home/vagrant/.vscode-server
chown -R vagrant:vagrant /home/vagrant/.vscode-server
