#!/bin/sh
yesterday=$(date -d "1 day ago" +"%Y-%m-%d")
yesterday2=$(date -d "1 day ago" +"%Y%m%d")
echo $yesterday
echo $yesterday2
cd /app/parkingStandServer/logs/
files=$(ls *{$yesterday,$yesterday2}*)
tar -czvf /app/logzip/log-parkingstand-server-$yesterday.tar.gz $files
rm -f $files
echo "backup completed"
