#!/bin/bash

python app/app.py &
APP_PID=$!

sleep 5

curl -f http://localhost:3000/health
RESULT=$?

kill $APP_PID

if [ $RESULT -eq 0 ]; then
  echo "Tests Passed"
  exit 0
else
  echo "Tests Failed"
  exit 1
fi
