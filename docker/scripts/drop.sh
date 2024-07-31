#!/bin/bash

# Halt on error
set -e

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> drop.sh <database>"
    exit 1
fi

USER=$DATABASE

psql -q -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
	DROP DATABASE $DATABASE;
    DROP USER $USER;
EOSQL

echo "The database $DATABASE was dropped." \
 | grep --color "^\|$DATABASE"
