#!/bin/sh

for filename in /root/entrypoint.d/*.sh; do
  echo "$filename"
  "$filename"
done

supervisord -c /etc/supervisord.conf
