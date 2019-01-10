# VERSION 1.0

FROM connector/base-python:v1.2.0
LABEL maintainer="sunxboy@gmail.com"
ENV AZK_VERSION=0.1.0-SNAPSHOT

# Add azkaban files
RUN mkdir -p /opt/cpip-connector/azkaban-executor/lib/  \ 
    mkdir -p /opt/cpip-connector/datax/

ADD /azkaban-exec-server-$AZK_VERSION.tar.gz /opt/cpip-connector

WORKDIR /opt/cpip-connector/azkaban-exec-server-$AZK_VERSION
COPY /conf/azkaban.properties conf/azkaban.properties
COPY /conf/log4j.properties conf/log4j.properties
COPY /conf/global.properties conf/global.properties
COPY /extlib extlib
COPY /plugins plugins
COPY /execlib /opt/cpip-connector/azkaban-executor/lib/

RUN mkdir cpip-connector-backup/ \ 
    mkdir logs/ && \
    ln -s /opt/cpip-connector/azkaban-exec-server-$AZK_VERSION/cpip-connector-backup/ -T /opt/cpip-connector/azkaban-executor/history  && \
    ln -s /opt/cpip-connector/azkaban-exec-server-$AZK_VERSION/logs/ -T /opt/cpip-connector/azkaban-executor/logs

# Azkaban executor port
EXPOSE 12321
VOLUME ["/opt/cpip-connector/datax"]
VOLUME ["/opt/cpip-connector/azkaban-executor/lib"]
VOLUME ["/opt/cpip-connector/azkaban-executor/history"]
VOLUME ["/opt/cpip-connector/azkaban-executor/logs"]

# Setup configurations
ADD /run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null