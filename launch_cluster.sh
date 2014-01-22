#!/bin/bash

set -e
set -x

if ! vagrant status | grep "default *running "
then
  vagrant up
fi

vagrant ssh -c "docker stop mysql-master mysql-slave && docker rm mysql-master mysql-slave || true"
vagrant ssh -c "cd /vagrant/master && docker build -t mysql-master ."
vagrant ssh -c "cd /vagrant/slave && docker build -t mysql-slave ."
vagrant ssh -c "docker run -d -p 3306:3306 -name mysql-master mysql-master && sleep 2"
vagrant ssh -c "docker run -d -p 3307:3306 -name mysql-slave mysql-slave && sleep 2"

