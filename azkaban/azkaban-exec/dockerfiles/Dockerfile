# VERSION 1.0

FROM connector/base-python:v1
LABEL maintainer="sunxboy@gmail.com"
ENV AZK_VERSION=0.1.0-SNAPSHOT

# Add azkaban files
RUN mkdir /execlib/ \ 
    mkdir /datax/

ADD /azkaban-exec-server-$AZK_VERSION.tar.gz /opt/

WORKDIR /opt/azkaban-exec-server-$AZK_VERSION
COPY /conf/azkaban.properties conf/azkaban.properties
COPY /conf/log4j.properties conf/log4j.properties
COPY /conf/global.properties conf/global.properties
COPY /extlib extlib
COPY /plugins plugins
COPY /execlib execlib

RUN mkdir -p cpip-connector-backup/ && \
    ln -s /opt/azkaban-exec-server-$AZK_VERSION/cpip-connector-backup/ -T /backup

# Azkaban executor port
EXPOSE 12321
VOLUME ["/execlib/"]
VOLUME ["/datax/"]
VOLUME ["/backup/"]

# Setup configurations
ADD /run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null
