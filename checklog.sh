#!/bin/sh
cd /app/activemq/data
var=$(du -sh leveldb)
result=$(echo ${var%K*})
#echo "result: $result"
target=10
if [${result%.*} -gt $target] 
then sh /opt/activemq.sh
fi

