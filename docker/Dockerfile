FROM postgres:16

COPY scripts/dump-database.sh /usr/local/bin/dump-database.sh
RUN chmod +x /usr/local/bin/dump-database.sh

COPY scripts/create-bundle.sh /usr/local/bin/create-bundle.sh
RUN chmod +x /usr/local/bin/create-bundle.sh

COPY scripts/drop-bundle.sh /usr/local/bin/drop-bundle.sh
RUN chmod +x /usr/local/bin/drop-bundle.sh
