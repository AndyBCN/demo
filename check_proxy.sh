#!/bin/bash

# read in proxy IP and port as arguements 1 and 2
HOST=$1
PORT=$2

TESTURL=https://www.google.com

#check proxy port
nc $HOST $PORT > /dev/null 2>&1
STATUS=$?
if [ "$STATUS" -ne 0 ]
then
# here we can email, create nagios compatible error or whatever...
echo "Error! Proxy $HOST not accepting connections on port $PORT, nc exited with status $STATUS"
exit 1
else
# so proxy seems open, lets test it
# we could use nc but lets check via curl
curl $TESTURL -x $HOST:$PORT > /dev/null 2>&1
STATUS=$?
if [ "$STATUS" -ne 0 ]
then
# here we can email, create nagios compatible error or whatever...
echo "Error! Unable to reach site $TESTURL, curl exited with status $STATUS"
exit 1
fi
fi
echo "Proxy $HOST:$PORT seems ok!"
exit 0
