#!/bin/bash

# To change Wordpress user login credentials:
# 1. Update docker secrets for wp_user, wp_password
# 2. Run manually in node terminal where db container is running

docker container exec $(docker ps --filter name=db -q) \
bash -c 'mysql -u $(cat /run/secrets/mysql_user) -p$(cat /run/secrets/mysql_password) ${MYSQL_DATABASE} -e \
"UPDATE wp_users SET user_login=\"$(cat /run/secrets/wp_user)\" WHERE ID=1 LIMIT 1;\
UPDATE wp_users SET user_pass=MD5(\"$(cat /run/secrets/wp_password)\") WHERE ID=1 LIMIT 1;\
UPDATE wp_users SET user_email=\"$(cat /run/secrets/wp_user)@example.com\" WHERE ID=1 LIMIT 1;"'