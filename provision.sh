#!/bin/bash

if [ ! -f /root/.provision/update ]; then
  echo "First time provisioning..."
  mkdir -p /root/.provision
  /vagrant/provision/first.sh
  VERSION=$(ls -1 /vagrant/provision/updates/ | tail -1 | sed -e s/[^0-9]//g)
  echo $VERSION > /root/.provision/update
fi

/vagrant/provision/always.sh

if [ -f /root/.provision/update ]; then
  VERSION=$(cat /root/.provision/update)
  for f in $(ls -1 /vagrant/provision/updates/*.sh); do
    FILENAME=${f##*/}
    if [[ $FILENAME =~ ^update-([0-9]{4})\.sh$ ]]; then
      if [[ "$FILENAME" > "update-$VERSION.sh" ]]; then
        echo "Running update $f..."
        $f
        echo ${BASH_REMATCH[1]} > /root/.provision/update
      fi
    fi
  done
fi
