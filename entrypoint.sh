#!/bin/sh
set -e

PORT="${PORT:-8080}"
cd /base

if [ -w /base/pref.ini ]; then
  CONF="/base/pref.ini"
else
  mkdir -p /tmp/sc
  cp -a /base/. /tmp/sc/
  cd /tmp/sc
  CONF="/tmp/sc/pref.ini"
fi

sed -i "s/^listen=.*/listen=0.0.0.0/" "$CONF"
sed -i "s/^port=.*/port=${PORT}/" "$CONF"

echo "==== pref.ini ===="
cat "$CONF"
echo "==== starting subconverter ===="

exec ./subconverter
