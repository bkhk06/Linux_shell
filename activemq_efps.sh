#!/bin/bash
cd /app/activemq_efps/bin
./activemq stop
cd /app/activemq_efps/log
tar -zcvf data-$(date +%Y%m%d-%H%M).tar.gz ../data/
cd /app/activemq_efps/data 
rm -rf activemq.log.*
cd leveldb
rm -rf *
cd /app/activemq_efps/bin
./activemq start
