FROM mysql-master

ADD ./mysql-setup.sh /mysql-setup.sh
RUN /bin/bash -l -c "/mysql-setup.sh"

EXPOSE 3307

CMD [ "mysqld", "--user=root", "--server-id=2", "--relay-log=relay-bin" ]

