FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN echo -e '[mysqld]\nuser=root\ndatadir=/var/lib/mysql\nsocket=/var/run/mysql.sock\nskip-grant-tables\nskip-name-resolve\nskip-innodb\ndefault_storage_engine=MyISAM' > /etc/mysql/my.cnf
RUN mysql_install_db
ENTRYPOINT ["mysqld"]
