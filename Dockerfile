FROM alpine:latest
RUN apk update && apk upgrade && apk add mysql mysql-client
RUN echo -e '[mysqld]\n\
             user=root\n\
             datadir=/var/lib/mysql\n\
             socket=/var/run/mysql.sock\n\
             skip-grant-tables\n\
             skip-name-resolve\n\
             skip-innodb\n\
             default_storage_engine=MyISAM\n\
             sync_frm=0\n\
             max_connections = 10\n\
             key_buffer_size = 4M\n\
             query_cache_size = 1M\n\
             tmp_table_size = 1M\n\
             max_allowed_packet = 4M\n\
             table_open_cache = 16\n\
             sort_buffer_size = 256K\n\
             net_buffer_length = 8K\n\
             read_buffer_size = 128K\n\
             read_rnd_buffer_size = 256K\n\
             myisam_sort_buffer_size = 4M\n\
             ' > /etc/mysql/my.cnf
RUN mysql_install_db
ENTRYPOINT ["mysqld"]
