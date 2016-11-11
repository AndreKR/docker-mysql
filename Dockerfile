FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN echo -e '[mysqld]\n\
             user=root\n\
             datadir=/var/lib/mysql\n\
             socket=/var/run/mysql.sock\n\
             skip-grant-tables\n\
             skip-name-resolve\n\
             skip-innodb\n\
             default_storage_engine=MyISAM\n\
             ' > /etc/mysql/my.cnf
RUN mysql_install_db
ENTRYPOINT ["mysqld"]
