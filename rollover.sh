#!/bin/bash

curl -k --cacert ./ca.crt --cert ./elasticlogrotate.crt --key ./elasticlogrotate.key -X POST "$ELASTIC_HOST:$ELASTIC_PORT/$INDEX_NAME/_rollover" -H 'Content-Type: application/json' -d'{"conditions": {"max_age": "$MAX_AGE","max_docs":$MAX_DOCS,"max_size": "$MAX_SIZE"}}'