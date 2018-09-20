# VERSION 1.0

FROM connector/base:v1

LABEL maintainer="sunxboy@gmail.com"

ENV AZK_VERSION=0.1.0-SNAPSHOT

# Add azkaban files
ADD /azkaban-web-server-$AZK_VERSION.tar.gz /opt/
COPY /keystore /opt/azkaban-web-server-$AZK_VERSION/
COPY /conf/azkaban.properties /opt/azkaban-web-server-$AZK_VERSION/conf/azkaban.properties
COPY /conf/azkaban-users.xml /opt/azkaban-web-server-$AZK_VERSION/conf/azkaban-users.xml
COPY /conf/global.properties /opt/azkaban-web-server-$AZK_VERSION/conf/global.properties
COPY /conf/log4j.properties /opt/azkaban-web-server-$AZK_VERSION/conf/log4j.properties
COPY /extlib /opt/azkaban-web-server-$AZK_VERSION/extlib

# Azkaban web server port
EXPOSE 8081
EXPOSE 8443

# Setup configurations
WORKDIR /opt/azkaban-web-server-$AZK_VERSION
ADD /run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null
