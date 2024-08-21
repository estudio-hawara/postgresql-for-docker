#!/bin/bash

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> restore-database.sh <database>"
    exit 1
fi

pushd /var/backups
    gzip -d $DATABASE.sql.gz
    psql --user postgres -f $DATABASE.sql
    gzip $DATABASE.sql
popd
