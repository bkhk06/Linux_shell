#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64
export APP_HOME=/usr/local/bgs/
export APP_JAR=bgs-core.jar

pid=`ps -ef | grep $APP_JAR | grep -v grep | awk '{print $2}'` 

echo "$APP_JAR running $pid"
if [ ! $pid ]; then  
  echo "$APP_JAR PID IS NULL"  
else  
  kill -9 $pid
  echo "$APP_JAR $pid killed"
fi  

echo "$APP_JAR ($pid) application stopped"



