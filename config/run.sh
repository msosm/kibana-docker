#!/bin/sh

cat <<EOF > $KIBANA_CONF
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://${ES_HOST}:9200"]
EOF

su-exec kibana /kibana-${KIBANA_VERSION}-linux-x86_64/bin/kibana