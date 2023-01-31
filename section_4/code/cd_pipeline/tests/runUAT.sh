#!/bin/bash

# set variables
hostname='localhost'
port=$1

# wait for the app to start
sleep 5 

status1=$(curl --write-out "%{http_code}" --silent --output /dev/null "${hostname}:${port}")
echo "$status1" # Would give you just the status

STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:8888)
echo "$STATUS"

# ping the app
status_code=$(curl --write-out %{http_code} --out /dev/null --silent ${hostname}:${port})

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
