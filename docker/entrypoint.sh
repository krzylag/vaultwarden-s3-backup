#!/bin/sh

for filename in /entrypoint.d/*.sh; do
  echo "$filename"
  "$filename"
done

/bin/bash -c "declare -p | grep -Ev '^declare -[[:alpha:]]*r' > /root/cron.env"
chmod 600 /root/cron.env
cron -f -L 15 > /dev/stdout 2>&1
