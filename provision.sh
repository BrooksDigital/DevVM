#!/bin/bash

if [ ! -f /root/.provision/update ]; then
  echo "First time provisioning..."
  mkdir -p /root/.provision
  bash /vagrant/provision/first.sh
  VERSION=$(ls -1 /vagrant/provision/updates/ | tail -1 | sed -e s/[^0-9]//g)
  echo $VERSION > /root/.provision/update
fi

bash /vagrant/provision/always.sh
