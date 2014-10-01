FROM mysql-master

# Force slave to generaet new UUID
RUN rm /opt/mysql/server-5.6/data/auto.cnf

ADD ./mysql-setup.sh /mysql-setup.sh
RUN /bin/bash -l -c "/mysql-setup.sh"

EXPOSE 3307

CMD [ "mysqld", "--user=root", "--server-id=2", "--relay-log=relay-bin" ]

