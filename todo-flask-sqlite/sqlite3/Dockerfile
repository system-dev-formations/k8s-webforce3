FROM alpine:3.11

RUN apk add --no-cache  \
    bash \
    tar \
    unzip \
    wget \
    sqlite

RUN

COPY ../sql/todos.sql /opt/sqlite

VOLUME ["/opt/sqlite"]




