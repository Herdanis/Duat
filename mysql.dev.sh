#!/usr/bin/env bash

# Import environment variable
. .env

# Delete file older than $TIME_PERIOD days by default is 30 day
# Old version of find
# find $PATH_BACKUP/$MYSQL_DATABASE* -mtime +$TIME_PERIOD -exec rm {} \;
find $PATH_BACKUP -name "$MYSQL_DATABASE*.sql" -type f -mtime +$TIME_PERIOD -delete

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
