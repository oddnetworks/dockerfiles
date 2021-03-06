#!/bin/sh

set -ex

apk add --no-cache --update --virtual .build-deps \
  make \
  gcc \
  g++ \
  python \
  linux-headers \
  paxctl \
  libgcc \
  libstdc++

# Make NodeJS
curl -sSL -o - https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xz
cd node-${NODE_VERSION}
./configure --prefix=/usr ${CONFIG_FLAGS}
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)
make install
paxctl -cm /usr/bin/node

# Install npm
if [ -x /usr/bin/npm ]; then
  npm install -g npm@${NPM_VERSION} &&
  find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf;
fi

# Cleanup
apk del .build-deps

rm -rf \
  /etc/ssl \
  /root/node-${NODE_VERSION} \
  ${RM_DIRS} \
  /usr/share/man \
  /tmp/* \
  /var/cache/apk/* \
  /root/.npm \
  /root/.node-gyp \
  /usr/lib/node_modules/npm/man \
  /usr/lib/node_modules/npm/doc \
  /usr/lib/node_modules/npm/html
