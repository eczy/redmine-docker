#!/bin/sh
set -e

# Redmine
PGPASSWORD=${REDMINE_DB_PASSWORD} /usr/bin/pg_dump -U ${REDMINE_DB_USERNAME} -h redmine_db -Fc --file=/backup/redmine/redmine.sqlc redmine
rsync -a /data/redmine/files /backup/redmine

# Delete backups older than 7 days
find $(pwd) -mtime +7 -type f -delete