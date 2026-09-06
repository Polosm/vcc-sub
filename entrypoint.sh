#!/bin/sh
set -e

PORT="${PORT:-8080}"

cd /base

if [ -w /base/pref.toml ]; then
  CONF="/base/pref.toml"
else
  mkdir -p /tmp/sc
  cp -a /base/. /tmp/sc/
  cd /tmp/sc
  CONF="/tmp/sc/pref.toml"
fi

sed -i "s/^[[:space:]]*port[[:space:]]*=.*/port = ${PORT}/" "$CONF"
sed -i 's/^[[:space:]]*listen[[:space:]]*=.*/listen = "0.0.0.0"/' "$CONF"

echo "==== pref.toml ===="
cat "$CONF"
echo "==== starting subconverter on 0.0.0.0:${PORT} ===="

if [ -x ./subconverter ]; then
  exec ./subconverter
elif [ -x /base/subconverter ]; then
  exec /base/subconverter
else
  exec subconverter
fi
