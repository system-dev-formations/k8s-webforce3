FROM alpine:3.11
ENV LANG en_US.utf8

ENV MAJOR 3
ENV VERSION 320200
ENV SHA1 3a9cd8b17c4724be61bc05f3c5e81bcdd78db0fe

RUN set -ex \
 \
 && apk add --no-cache --virtual .fetch-deps \
    bash \
    tar \
    unzip \
    wget \
    readline \
 \
 && wget https://www.sqlite.org/2021/sqlite-autoconf-3350300.tar.gz \
 && tar -zxvf sqlite-autoconf-3350300.tar.gz \
 && cd sqlite-autoconf-3350300 \
 \
 && apk add --no-cache --virtual .build-deps \
    cmake clang clang-dev \
    bison \
    coreutils \
    dpkg-dev dpkg \
    flex \
 	gcc \
 	g++ \
 	wget \
 	curl \
 	freetds \
 	openssl \
 	libc-dev \
 	libedit-dev \
 	libxml2-dev \
 	libxslt-dev \
 	linux-headers \
 	make \
 	openssl-dev \
 	perl-utils \
 	perl-ipc-run \
 	python \
 	python3 \
    perl-dev \
    python-dev \
 	util-linux-dev \
 	zlib-dev \
 	icu-dev \
 	readline-dev \
    \
  && ./configure --enable-static \
  && make \
  && mkdir -p /opt/sqlite \
  && mv sqlite3 /opt/sqlite/ \
  && apk del  .build-deps

VOLUME ["/opt/sqlite"]




