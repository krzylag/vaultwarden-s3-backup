#!/bin/bash

for filename in /templates/cron.d/*; do
  TARGET="/etc/cron.d/${filename##*/}"
  echo "* **********************************"
  echo "* Installing system cron file from $filename to ${TARGET}"
  cp "$filename" "$TARGET"

  sed -i "s/__CRON_TIME_DEF__/${CRON_TIME_DEF}/" "$TARGET"

  echo "* **********************************"
done
