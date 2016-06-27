FROM oddnetworks/alpine-base:latest
MAINTAINER Odd Networks <info@oddnetworks.com>

RUN apk update \
    && apk --update add openjdk8-jre-base \
    && adduser -S dynamo \
    && mkdir /dynamodb \
    && curl -s -L -o - http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar -xzf - -C /dynamodb \
    && chown -R dynamo /dynamodb/* \
    && rm -rf /var/cache/apk/*

ADD scripts/dynamo.sh /dynamodb/dynamo.sh

RUN chmod +x /dynamodb/dynamo.sh 

USER dynamo

WORKDIR /dynamodb/

EXPOSE 8000

ENTRYPOINT ["/dynamodb/dynamo.sh"]
