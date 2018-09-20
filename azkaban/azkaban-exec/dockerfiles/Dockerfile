# VERSION 1.0

FROM connector/base-python:v1

LABEL maintainer="sunxboy@gmail.com"

ENV AZK_VERSION=0.1.0-SNAPSHOT


# Add azkaban files
RUN mkdir /execlib/ \ 
    mkdir /datax/

ADD /azkaban-exec-server-$AZK_VERSION.tar.gz /opt/
COPY /conf/azkaban.properties /opt/azkaban-exec-server-$AZK_VERSION/conf/azkaban.properties
COPY /conf/log4j.properties /opt/azkaban-exec-server-$AZK_VERSION/conf/log4j.properties
COPY /conf/global.properties /opt/azkaban-exec-server-$AZK_VERSION/conf/global.properties
COPY /extlib /opt/azkaban-exec-server-$AZK_VERSION/extlib
COPY /plugins /opt/azkaban-exec-server-$AZK_VERSION/plugins

# Azkaban executor port
EXPOSE 12321
VOLUME ["/execlib/"]
VOLUME ["/datax/"]

# Setup configurations
WORKDIR /opt/azkaban-exec-server-$AZK_VERSION
ADD /run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null
