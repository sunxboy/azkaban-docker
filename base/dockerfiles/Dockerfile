# VERSION 1.0

FROM anapsix/alpine-java:8

LABEL maintainer="sunxboy@gmail.com"

RUN apk add --no-cache bash tzdata
ENV TZ Asia/Shanghai

COPY /s6-overlay-amd64-1.20.0.0.tar.gz /tmp/
RUN tar -xf /tmp/s6-overlay-amd64-1.20.0.0.tar.gz -C /
RUN rm -f /tmp/s6-overlay-amd64-1.20.0.0.tar.gz

COPY /rootfs/etc /etc/

ENTRYPOINT ["/init"]
