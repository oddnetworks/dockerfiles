FROM oddnetworks/alpine-base:latest
MAINTAINER Odd Networks <info@oddnetworks.com>

ENV DATADIR /var/lib/dynamodb \
    DYNAMODB_VERSION latest

RUN apk update; \
  apk add openjdk7;
  curl -o /tmp/dynamo.tar.gz -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_${DYNAMODB_VERSION}
  && mkdir -p /opt/dynamodb \
  && tar -xzvf /tmp/dynamo.tar.gz -C /opt/dynamodb \
  && rm /tmp/dynamo.tar.gz

WORKDIR /opt/dynamodb

VOLUME $DATADIR
EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/opt/dynamodb/DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", $DATADIR]
