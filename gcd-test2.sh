#!/bin/bash

result="/tmp/$$-result"

./gcd.sh 10 15 > $result
if [ `cat $result | cut -c 1-4` == "CGD=" ]
then
    echo "OK"
else
    echo "NG"
fi

rm /tmp/$$-*

