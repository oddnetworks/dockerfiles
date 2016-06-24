FROM oddnetworks/alpine-base-consul:latest
MAINTAINER Odd Networks <info@oddnetworks.com>

ENV NODE_VERSION=v4.4.6
ENV NPM_VERSION=3.10.2

ENV CONFIG_FLAGS="--fully-static --without-snapshot" DEL_PKGS="libgcc libstdc++" RM_DIRS=/usr/include

WORKDIR /root

ADD build.sh build.sh

RUN chmod +x ./build.sh \
  && sync \
  && NODE_VERSION=${NODE_VERSION} NPM_VERSION=${NPM_VERSION} ./build.sh \
  && rm ./build.sh
