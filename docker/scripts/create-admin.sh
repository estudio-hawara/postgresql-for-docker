#!/bin/bash

# Halt on error
set -e

USER=$1

if [ -z "$USER" ]
then
    echo "The admin name is missing. Try again:"
    echo "> create-admin.sh <admin>"
    exit 1
fi

PASSWORD=`openssl rand -base64 16`
PASSWORD=${PASSWORD:0:16}

psql -q -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
	CREATE USER $USER WITH ENCRYPTED PASSWORD '$PASSWORD';
	ALTER USER $USER CREATEDB;
EOSQL

echo "New user $USER created with password $PASSWORD." \
 | grep --color "^\|$USER\|$PASSWORD"
