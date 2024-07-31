FROM postgres:16

COPY scripts/dump.sh /usr/local/bin/dump.sh
RUN chmod +x /usr/local/bin/dump.sh

COPY scripts/create.sh /usr/local/bin/create.sh
RUN chmod +x /usr/local/bin/create.sh

COPY scripts/drop.sh /usr/local/bin/drop.sh
RUN chmod +x /usr/local/bin/drop.sh
