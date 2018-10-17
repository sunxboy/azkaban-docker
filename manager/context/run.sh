#!/bin/sh
# Wait for database to get available

DB_LOOPS="200"

ENV=${ENV:-"DEV"}

MYSQL_HOST=${MYSQL_HOST:-"mysql"}
MYSQL_PORT=${MYSQL_PORT:-"3306"}
MYSQL_USER=${MYSQL_USER:-"azkaban"}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"azkaban"}
MYSQL_DB=${MYSQL_DB:-"azkaban"}

MANAGER_HOST=${MANAGER_HOST:-"manager"}
MANAGER_PORT=${MANAGER_PORT:-"7001"}

AZKABAN_HOST=${AZKABAN_HOST:-"azkaban"}
AZKABAN_PORT=${AZKABAN_PORT:-"8081"}
AZKABAN_USER=${AZKABAN_USER:-"azkaban"}
AZKABAN_PASSWORD=${AZKABAN_PASSWORD:-"azkaban"}
AZKABAN_DB=${AZKABAN_DB:-"azkaban"}

SETUP_MODE=${SETUP_MODE:-"IGNORE"}

#CONNECTOR_TIMEOUT=${CONNECTOR_TIMEOUT:-"120"}
#CONNECTOR_FILE_PYPATH=${CONNECTOR_FILE_PYPATH:-"/file2csv/ExcelToCsv.py"}
#CONNECTOR_FILE_DATA=${CONNECTOR_FILE_DATA:-"/file2csv/data/"}
#SECURITY_ENABLE=${SECURITY_ENABLE:-"false"}
#SECURITY_USERNAME=${SECURITY_USERNAME:-"admin"}
#SECURITY_PASSWORD=${SECURITY_PASSWORD:-"123"}
#DATAX_PATH=${DATAX_PATH:-"/datax"}
#EMAIL_HOST=${EMAIL_HOST:-"smtp.163.com"}
#EMAIL_PORT=${EMAIL_PORT:-"25"}
#EMAIL_USER=${EMAIL_USER:-"connector_alarm\@163.com"}
#EMAIL_PASSWORD=${EMAIL_PASSWORD:-"skycomm123"}
#EMAIL_RECEIVE=${EMAIL_RECEIVE:-"huhao\@skycomm.com.cn"}
#EMAIL_CC=${EMAIL_CC:-"sunxianbing\@skycomm,wuguojun\@skycomm.com.cn"}

#wait for mysql
i=0
while ! nc $MYSQL_HOST $MYSQL_PORT >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`
  if [ $i -ge $DB_LOOPS ]; then
applyVariable "echo "$(date) - ${MYSQL_HOST}:${MYSQL_PORT} still not reachable, giving up"
applyVariable "exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_HOST}:${MYSQL_PORT}..."
  sleep 1
done


case "$SETUP_MODE" in
  INIT)
        echo "import schema to $MYSQL_HOST"
        mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < sql/init/init-schema.sql

        echo "import data to $MYSQL_HOST"
        mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < sql/init/init-data.sql
        ;;
  UPDATE)
        echo "update schema to $MYSQL_HOST"
        mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < sql/update/update-schema.sql

        echo "update data to $MYSQL_HOST"
        mysql -h $MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < sql/update/update-data.sql
        ;;
  IGNORE)
        ;;		
  *)
        echo "Usage: SETUP_MODE: $SETUP_MODE only can be {INIT|UPDATE}"
        exit 1
        ;;
esac

# replace application.properties by environment variables
function applyVariable() {
  local propertyValue=$(eval echo \${$1})
  sed -i "s@%$1%@$propertyValue@g"  application.properties
}

applyVariable "ENV"

applyVariable "MYSQL_HOST"
applyVariable "MYSQL_PORT"
applyVariable "MYSQL_USER"
applyVariable "MYSQL_PASSWORD"
applyVariable "MYSQL_DB"

applyVariable "AZKABAN_HOST"
applyVariable "AZKABAN_PORT"
applyVariable "AZKABAN_USER"
applyVariable "AZKABAN_PASSWORD"
applyVariable "AZKABAN_DB"

applyVariable "MANAGER_HOST"
applyVariable "MANAGER_PORT"

#applyVariable "CONNECTOR_TIMEOUT"
#applyVariable "CONNECTOR_FILE_PYPATH"
#applyVariable "CONNECTOR_FILE_DATA"
#applyVariable "SECURITY_ENABLE"
#applyVariable "SECURITY_USERNAME"
#applyVariable "SECURITY_PASSWORD"
#applyVariable "DATAX_PATH"
#applyVariable "EMAIL_HOST"
#applyVariable "EMAIL_PORT"
#applyVariable "EMAIL_USER"
#applyVariable "EMAIL_PASSWORD"
#applyVariable "EMAIL_RECEIVE"
#applyVariable "EMAIL_CC"
	
#start the daemon
exec java -jar lib/cpip-connector-manager.jar --spring.config.location=application.properties
