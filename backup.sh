#!/bin/bash

source .env

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> backup-database.sh <database>"
    exit 1
fi

./dc exec postgresql dump-database.sh $DATABASE > $BACKUPS_FOLDER/$DATABASE.sql

tar -zcvf $BACKUPS_FOLDER/$DATABASE.tar.gz --remove-files --absolute-names $BACKUPS_FOLDER/$DATABASE.sql
