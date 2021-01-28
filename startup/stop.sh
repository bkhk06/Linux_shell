#!/bin/sh
APP_HOME=/usr/local/UMP-client
APP_JAR=ump-client.jar
pid=`ps -ef | grep $APP_JAR | grep -v grep | awk '{print $2}'`
echo "$APP_JAR running $pid"

if [ ! $pid ]; then
  echo "$APP_JAR PID IS NULL"
else
  kill -9 $pid
  echo "$APP_JAR $pid killed"
fi
echo "$APP_JAR ($pid) application stopped"