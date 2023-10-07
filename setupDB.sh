#!/bin/bash

# SCRIPT TO SETUP DATABASE BASED ON .ENV FILE (LARAVEL)
# JEFFMX
# THE SCRIPT OUTPUT IS THE SETENCES FOR MYSQL

#!/usr/bin/bash

linea=$(grep "DB_DATABASE=" .env)
db=${linea#*=}
linea=$(grep "DB_USERNAME=" .env)
dbuser=${linea#*=}
linea=$(grep "DB_PASSWORD=" .env)
dbpass=${linea#*=}
echo "CREATE DATABASE $db;CREATE USER '$dbuser'@'%' IDENTIFIED BY '$dbpass';GRANT ALL PRIVILEGES ON $db.* TO '$dbuser'@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"
