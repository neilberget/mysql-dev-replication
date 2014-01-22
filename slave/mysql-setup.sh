#!/bin/sh

adduser --disabled-password --gecos "" mysql

cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql.server
# update-rc.d -f mysql remove
# update-rc.d mysql.server defaults

/opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql

sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /opt/mysql/server-5.6/my.cnf

MASTER_BIN_CONF="
server_id=2\n"
#read_only=1\n"
echo $MASTER_BIN_CONF >> /opt/mysql/server-5.6/my.cnf

# sed -i '/^datadir*/ s|/var/lib/mysql|/data/mysql|' /etc/mysql/my.cnf
# 
# rm -Rf /var/lib/mysql

mysqld --user=root --server-id=2 --relay-log=relay-bin &
sleep 5

echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
echo "GRANT ALL ON *.* TO slave@'%' IDENTIFIED BY 'slave' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

echo "CHANGE MASTER TO MASTER_HOST='192.168.50.2', MASTER_PORT='3306', MASTER_USER='root'" | mysql

