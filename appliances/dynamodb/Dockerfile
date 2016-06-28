FROM ubuntu:trusty
MAINTAINER Odd Networks <info@oddnetworks.com>

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_VERSION=7 \
    DATADIR=/var/lib/dynamodb

## Create a 'docker' user
RUN  addgroup --gid 9999 docker \
  && adduser --uid 9999 --gid 9999 --disabled-password --gecos "Docker User" docker \
  && usermod -L docker \
  && apt-get update && apt-get install -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      language-pack-en \
      locales \
  && apt-get install -y --no-install-recommends \
      curl \
      psmisc \
      git \
      build-essential \
      python \
  && echo oracle-java$JAVA_VERSION-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  && add-apt-repository -y ppa:webupd8team/java \
  && apt-get update \
  && apt-get install -y --force-yes oracle-java$JAVA_VERSION-installer \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

## Ensure UTF-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8 \
    LC_ALL     en_US.UTF-8
RUN dpkg-reconfigure locales

WORKDIR /home/docker
RUN mkdir $DATADIR && chown docker:docker $DATADIR
COPY entrypoint.sh /home/docker/entrypoint.sh
RUN chmod +x /home/docker/entrypoint.sh

USER docker

RUN /usr/bin/curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest | /bin/tar xz

EXPOSE 8000
VOLUME $DATADIR

ENTRYPOINT ["/home/docker/entrypoint.sh"]

CMD ["-inMemory"]
