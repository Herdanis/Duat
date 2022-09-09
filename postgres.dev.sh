#!/usr/bin/env bash

# Import environment variable
. .env

# Delete file older than $TIME_PERIOD days by default is 30 day
# Old version of find
# find $PATH_BACKUP/$POSTGRES_DATABASE* -mtime +$TIME_PERIOD -exec rm {} \;
find $PATH_BACKUP -name "$POSTGRES_DATABASE*.tar.gz" -type f -mtime +$TIME_PERIOD -delete

# set format time to naming scheme
timestamp=$(date +%H-%d-%m-%Y)

# Run pg_dump for backup database and save on specific location
PGPASSWORD=$POSTGRES_PASSWORD pg_dump --host=$POSTGRES_HOST --port=$POSTGRES_PORT --username=$POSTGRES_USERNAME $POSTGRES_DATABASE >"$POSTGRES_DATABASE.sql"

# Compressing the sql file to tar.gz
tar -czf $PATH_BACKUP/"$POSTGRES_DATABASE"_"$timestamp".tar.gz "$POSTGRES_DATABASE".sql

# Get PID the compressing process
pid=$!

# Waiting the compressing done
wait $pid

# Delete the sql file
rm "$POSTGRES_DATABASE".sql
