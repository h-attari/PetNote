#!/bin/bash

# Set variables
DB_NAME="Lucifer"
SQL_FILE_PATH="/home/Lucifer.sql"

# MySQL Credentials
MYSQL_USER="root"
MYSQL_PASSWORD="root"

# Check if SQL file exists
if [ ! -f "$SQL_FILE_PATH" ]; then
    echo "Error: SQL file not found at $SQL_FILE_PATH"
    exit 1
fi

# Create database inside MySQL container
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Import SQL file into the database
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" < "$SQL_FILE_PATH"