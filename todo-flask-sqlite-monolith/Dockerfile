FROM alpine:3.11
ENV LANG en_US.utf8

RUN set -ex \
 \
 && apk add --no-cache --virtual .fetch-deps \
    python3 \
    python3-dev \
    curl \
    sqlite \
 && pip3 install --no-cache-dir --upgrade pip

ADD templates /opt/templates
COPY requirements.txt .
RUN pip3 install -r requirements.txt && \
    mkdir -p /opt/data

COPY todo.py /opt
COPY todo.cfg /opt
COPY todos.sql /opt
RUN  cd /opt && cat todos.sql | sqlite3 tododb.db

VOLUME /opt

ENTRYPOINT FLASK_APP=/opt/todo.py flask run --host=0.0.0.0

