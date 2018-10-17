#!/bin/sh
# Wait for database to get available

DB_LOOPS="120"
MYSQL_HOST=${MYSQL_HOST:-"mysql"}
MYSQL_PORT=${MYSQL_PORT:-"3306"}
MYSQL_USER=${MYSQL_USER:="azkaban"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:="azkaban"}
EXECUTOR_HOST=${EXECUTOR_HOST:="executor"}
AZKABAN_USER=${AZKABAN_USER:="azkaban"}
AZKABAN_PASSWORD=${AZKABAN_PASSWORD:="azkaban"}
AZKABAN_DB=${AZKABAN_DB:="azkaban"}

START_CMD="bin/start-web.sh"

#wait for mysql
i=0
while ! nc $MYSQL_HOST $MYSQL_PORT >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`
  if [ $i -ge $DB_LOOPS ]; then
    echo "$(date) - ${MYSQL_HOST}:${MYSQL_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_HOST}:${MYSQL_PORT}..."
  sleep 1
done

# config azkaban.properties
sed -i "s/&//" $START_CMD
sed -i "s@%MYSQL_HOST%@${MYSQL_HOST}@g"  conf/azkaban.properties
sed -i "s@%MYSQL_PORT%@${MYSQL_PORT}@g"  conf/azkaban.properties
sed -i "s@%EXECUTOR_HOST%@${EXECUTOR_HOST}@g"  conf/azkaban.properties
sed -i "s@%AZKABAN_DB%@${AZKABAN_DB}@g" conf/azkaban.properties
sed -i "s@%MYSQL_USER%@${MYSQL_USER}@g" conf/azkaban.properties
sed -i "s@%AZKABAN_USER%@${AZKABAN_USER}@g" conf/azkaban-users.xml
sed -i "s@%MYSQL_PASSWORD%@${MYSQL_PASSWORD}@g" conf/azkaban.properties
sed -i "s@%AZKABAN_PASSWORD%@${AZKABAN_PASSWORD}@g" conf/azkaban-users.xml

#start the daemon
exec $START_CMD
