This script will set up local MySQL replication.

Requirements:

* Virtualbox
* Vagrant 1.4+

Instructions:

    ./launch_cluster.sh

Now you'll have a mysql master host at 192.168.50.2:3306 and a myqsl slave at 192.168.50.2:3307


Connect to the master with:

    mysql -h 192.168.50.2 -u root

And to the slave:

    mysql -h 192.168.50.2 -P 3307 -u slave -pslave
