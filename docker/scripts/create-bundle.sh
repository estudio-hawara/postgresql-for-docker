#!/bin/bash

# Halt on error
set -e

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> create-bundle.sh <database>"
    exit 1
fi

USER=$DATABASE

PASSWORD=`openssl rand -base64 16`
PASSWORD=${PASSWORD:0:16}

psql -q -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
	CREATE USER $USER WITH ENCRYPTED PASSWORD '$PASSWORD';
	CREATE DATABASE $DATABASE;
	GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $USER;
EOSQL

echo "New database $DATABASE created with password $PASSWORD." \
 | grep --color "^\|$DATABASE\|$PASSWORD"
