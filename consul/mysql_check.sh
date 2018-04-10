#!/usr/bin/env sh

MYSQL_USER = "$(cat $MYSQL_USER_FILE)"
MYSQL_PASSWORD = "$(cat $MYSQL_PASSWORD_FILE)"
/usr/bin/mysqladmin ping -h db -u ${MYSQL_USER} -p${MYSQL_PASSWORD}