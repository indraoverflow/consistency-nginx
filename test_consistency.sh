#!/bin/bash

echo "Testing consistent hashing via router (10x)"
for i in {1..10}; do
  echo -n "$i: "
  curl -s -D - -o /dev/null -H "Cache-Control:" "http://localhost:7447/get?transaction_id=txn$i" \
    | grep -i -E '^(x-node|x-cache-status):' | tr -d '\r' | paste -sd' '
done
