#!/bin/bash
cd /app/activemq_cdm/bin
./activemq stop
cd /app/activemq_cdm/log
tar -zcvf data-$(date +%Y%m%d-%H%M).tar.gz ../data/
cd /app/activemq_cdm/data 
rm -rf activemq.log.*
cd leveldb
rm -rf *
cd /app/activemq_cdm/bin
./activemq start
