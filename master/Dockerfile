FROM ubuntu:12.04

RUN apt-get update

# Common packages
RUN apt-get install -y curl python-software-properties git-core
RUN apt-get install wget libaio1

RUN apt-get update
#RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-client mysql-server
RUN wget -O mysql-5.6.deb http://cdn.mysql.com/Downloads/MySQL-5.6/mysql-5.6.21-debian6.0-x86_64.deb
# &> /dev/null
RUN dpkg -i  mysql-5.6.deb

ENV PATH $PATH:/opt/mysql/server-5.6/bin
ADD ./mysql-setup.sh /mysql-setup.sh
RUN /bin/bash -l -c "/mysql-setup.sh"

EXPOSE 3306

CMD [ "mysqld", "--user=root", "--server-id=1", "--log-bin=mysql-bin" ]


