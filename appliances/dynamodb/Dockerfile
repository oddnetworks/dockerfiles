FROM oddnetworks/java:7
MAINTAINER Odd Networks <info@oddnetworks.com>

WORKDIR /home/docker
ENV DATADIR /var/lib/dynamodb

USER root
RUN mkdir $DATADIR && chown docker:docker $DATADIR
USER docker

RUN /usr/bin/curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest | /bin/tar xz

EXPOSE 8000
VOLUME $DATADIR

COPY entrypoint.sh /home/docker/entrypoint.sh
USER root
RUN chmod +x /home/docker/entrypoint.sh
USER docker

ENTRYPOINT ["/home/docker/entrypoint.sh", "-dbPath /var/lib/dynamodb"]
