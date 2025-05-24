#!/usr/bin/env bash
# wait-for-it.sh - adapted from https://github.com/vishnubob/wait-for-it

host="$1"
port="$2"

shift 2

while ! nc -z "$host" "$port"; do
  echo "Várok az adatbázisra ($host:$port)..."
  sleep 1
done

exec "$@"
