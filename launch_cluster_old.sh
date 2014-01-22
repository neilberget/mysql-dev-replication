#!/bin/bash

set -e
set -x

# Start Master
pushd master

if ! vagrant status | grep "default *running "
then
  vagrant up
fi

vagrant ssh -c "docker stop mysql-master && docker rm mysql-master || true"
vagrant ssh -c "cd /vagrant && docker build -t mysql-master ."
vagrant ssh -c "docker run -d -p 3306:3306 -name mysql-master mysql-master && sleep 2"

popd


# Start Slave
pushd slave

if ! vagrant status | grep "default *running "
then
  vagrant up
fi

vagrant ssh -c "docker stop mysql-slave && docker rm mysql-slave || true"
vagrant ssh -c "cd /vagrant && docker build -t mysql-slave ."
vagrant ssh -c "docker run -d -p 3306:3306 -name mysql-slave mysql-slave"

popd
