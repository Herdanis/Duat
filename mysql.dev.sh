#!/usr/bin/env bash

# Import environment variable
. .env

# set format time to naming scheme
timestamp=$(date +%H-%d-%m-%Y)

# Run mysqldump for backup database and save on specific location
mysqldump --host="$MYSQL_HOST" --user="$MYSQL_USERNAME" --password="$MYSQL_PASSWORD" --port="$MYSQL_PORT" $MYSQL_DATABASE >"$MYSQL_DATABASE"_"$timestamp".sql

# Compressing the sql file to tar.gz
tar -czf $PATH_BACKUP/"$MYSQL_DATABASE"_"$timestamp".tar.gz "$MYSQL_DATABASE".sql

# Get PID the compressing process
pid=$!

# Waiting the compressing done
wait $pid

# Delete the sql file
rm "$MYSQL_DATABASE".sql
