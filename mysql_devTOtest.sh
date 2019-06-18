#!/bin/sh
Date=$(date +"%Y%m%d")
Time=$(date +"%Y%m%d%H%m%S")
echo "=======================Transer data from dev to test=================="
idA=`docker ps | grep mysql-test|awk 'NR==1 {print $1}'`
idB=`docker ps -a | grep mysql-test|awk 'NR==1 {print $1}'`
if [ -z "$idA" ]; then
   echo "mysql-test container was not started!"
   if [ -z "$idB" ]; then
      echo "container with name 'mysql-test' was not exists!"
      exit
   else
      echo "it needs to rename container name;"
      docker rename mysql-test mysql-test_$Time
      cd /home/docker/workspace
      rm -rf mysql-test
      echo "mysql-test data dir was deleted!"
      cp -rf mysql-dev mysql-test
      echo "copied data dir from mysql-dev to mysql-test~"
      docker run -idt --privileged=true --restart=always --name mysql-test -p3309:3306  -v /home/docker/workspace/mysql-test:/var/lib/mysql  -e MYsql_ROOT_PASSWORD=adccadcc mysql:5.7
      echo "mysql-test was started! And new container was created!"
      docker ps |grep mysql-test
   exit
   fi 
  exit
else
   docker stop mysql-test
   echo "mysql-test container was stopped!"
   docker rename  mysql-test mysql-test_$Time
   echo "mysql-test container was moved!"
   cd /home/docker/workspace
   rm -rf mysql-test
   echo "mysql-test data dir was deleted!"
   cp -rf mysql-dev mysql-test
   echo "copied data dir from mysql-dev to mysql-test~"
   docker run -idt --privileged=true --restart=always --name mysql-test -p3309:3306  -v /home/docker/workspace/mysql-test:/var/lib/mysql  -e MYsql_ROOT_PASSWORD=adccadcc mysql:5.7
   echo "mysql-test was started! And new container was created!"
   docker ps |grep mysql-test
   exit
fi
