FROM  connector/base-mysql:v1

LABEL maintainer="sunxboy@gmail.com"

RUN mkdir -p /file2csv/data \
    mkdir /datax \
    mkdir -p /opt/connector/lib \
    mkdir -p /opt/connector/sql \
    chmod +x /opt/connector

COPY /sql /opt/connector/sql
COPY /cpip-connector-manager.jar /opt/connector/lib/
COPY /ExcelToCsv.py /file2csv/
COPY /application.properties /opt/connector/


EXPOSE 7001
VOLUME ["/file2csv/data/"]
VOLUME ["/datax/"]

WORKDIR /opt/connector/
ADD /run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null
