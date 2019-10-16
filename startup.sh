#!/bin/bash
cd /app/zookeeper_cdm/bin
./zkServer.sh start

cd /app/zookeeper_efps/bin
./zkServer.sh start

cd /app/activemq_cdm/bin
./activemq start

cd /app/activemq_efps/bin
./activemq start
