#!/bin/bash

# This script creates database backups and uploads them to an external server.

# Update package lists and install MySQL client
echo "Updating package lists and installing MySQL client..."
sudo apt-get update
sudo apt-get install -y mysql-client

# Create a directory for backups
echo "Creating backup directory..."
mkdir -p /backup

# Get a list of databases
echo "Fetching database list..."
databases=$(mysql -e "SHOW DATABASES;" -s --skip-column-names)

# Loop through databases and create backups
for db in $databases; do
  echo "Backing up database: $db"
  mysqldump $db > "/backup/$db.sql"
done

# Compress all backups into an archive
echo "Compressing backups..."
tar -czvf backup.tar.gz /backup

# Transfer the archive to an external server
echo "Transferring backup to remote server..."
scp backup.tar.gz user@remote-server:/path/to/backup/folder

# Cleanup local backups
echo "Cleaning up local backup files..."
rm -rf /backup
rm backup.tar.gz
