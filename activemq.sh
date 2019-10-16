#!/bin/bash
cd /app/activemq/bin
./activemq stop
cd /app/activemq/log
tar -zcvf data-$(date +%Y%m%d-%H%M).tar.gz ../data/
cd /app/activemq/data
rm -rf activemq.log.*
cd leveldb
rm -rf *
cd /app/activemq/bin
./activemq start
