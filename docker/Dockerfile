FROM postgres:16

COPY scripts/* /usr/local/bin/

RUN chmod +x /usr/local/bin/create-admin.sh
RUN chmod +x /usr/local/bin/create-bundle.sh
RUN chmod +x /usr/local/bin/drop-bundle.sh
RUN chmod +x /usr/local/bin/dump-database.sh
RUN chmod +x /usr/local/bin/restore-database.sh
