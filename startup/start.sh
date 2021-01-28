#!/bin/sh
APP_HOME=/home/AppDeploy/UMP-client
APP_JAR=ump-client.jar
JAVA_HOME=/usr/local/jdk1.8.0_112
pid=`ps -ef | grep $APP_JAR | grep -v grep | awk '{print $2}'`
echo "$APP_JAR running $pid"

if [ ! $pid ]; then
  echo "$APP_JAR PID IS NULL"
else
  kill -9 $pid
  echo "$APP_JAR $pid killed"
fi
 java -Dlogback.configurationFile=./config/client_logback.xml -server -jar $APP_HOME/$APP_JAR &
pid=`ps -ef | grep $APP_JAR | grep -v grep | awk '{print $2}'`
echo "$APP_JAR ($pid) application started"
