#!/bin/bash
while true; do
  flask db upgrade
  if [[ "$?" == "0" ]]; then
    break
  fi
  echo Upgrade command failed, retrying in 5 secs...
  sleep 5
done
flask db upgrade
exec gunicorn -b :5001 --access-logfile - --error-logfile - run:app