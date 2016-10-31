FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN echo -e '[mysqld]\nuser=root\ndatadir=/var/lib/mysql\nskip-grant-tables\nskip-name-resolve' > /etc/mysql/my.cnf
ENTRYPOINT ["mysqld"]
