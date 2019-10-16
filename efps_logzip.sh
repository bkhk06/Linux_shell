#!/bin/sh
yesterday=$(date -d "1 day ago" +"%Y-%m-%d")
yesterday2=$(date -d "1 day ago" +"%Y%m%d")
echo $yesterday
echo $yesterday2
cd /app/efpsServer/logs/
files=$(ls *{$yesterday,$yesterday2}*)
tar -czvf /app/logzip/log-efps-server-$yesterday.tar.gz $files
rm -f $files
echo "backup completed"
