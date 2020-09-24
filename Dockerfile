FROM node:10.21-alpine3.11

ENV KIBANA_VERSION 7.8.1
ENV ES_HOST elasticsearch_host
ENV KIBANA_CONF kibana.yaml

COPY config/run.sh /

RUN apk --update --upgrade add su-exec \
    && wget https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz \
    && tar -xzf kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz \
    && rm -rf kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz \
    && rm -rf /kibana-${KIBANA_VERSION}-linux-x86_64/node \
    && mkdir -p /kibana-${KIBANA_VERSION}-linux-x86_64/node/bin \
    && ln -s /usr/local/bin/node /kibana-${KIBANA_VERSION}-linux-x86_64/node/bin/node \
    && adduser -DH -s /sbin/nologin kibana \
    && chown -R kibana:kibana /kibana-${KIBANA_VERSION}-linux-x86_64/

