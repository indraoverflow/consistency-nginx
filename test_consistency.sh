#!/bin/bash

echo "Testing consistent hashing via router (10x)"
for i in {1..10}; do
  curl -s -o /dev/null -w "$i: %{http_code} | X-Node: %{redirect_url}\\n" -H "Cache-Control:" -I http://localhost:7447/get
done
