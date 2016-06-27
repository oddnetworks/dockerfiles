FROM alpine:3.4
MAINTAINER Odd Networks <info@oddnetworks.com>

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TERM=xterm

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories; \
    apk update; apk upgrade; \
    apk add bash bind-tools curl jq
