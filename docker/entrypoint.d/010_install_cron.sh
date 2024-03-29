#!/bin/bash

for filename in /root/templates/crontabs/*; do
  TARGET="/etc/crontabs/${filename##*/}"
  echo "* **********************************"
  echo "* Installing system cron file from $filename to ${TARGET}"
  cp "$filename" "$TARGET"
  sed -i "s/__CRON_TIME_DEF__/${CRON_TIME_DEF}/" "$TARGET"
  echo "* **********************************"
done
