#!/bin/bash

DATABASE=$1

if [ -z "$DATABASE" ]
then
    echo "The database name is missing. Try again:"
    echo "> dump-database.sh <database>"
    exit 1
fi

pg_dump --user postgres $DATABASE
