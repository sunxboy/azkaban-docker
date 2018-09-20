FROM connector/base:v1

LABEL maintainer="sunxboy@gmail.com"

RUN apk add --no-cache mysql-client && rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]