#!/bin/sh
Date=$(date +"%Y%m%d")
Time=$(date +"%Y%m%d%H%m%S")
echo "=======================Transer data from dev to demo=================="
idA=`docker ps | grep mysql-demo|awk 'NR==1 {print $1}'`
idB=`docker ps -a | grep mysql-demo|awk 'NR==1 {print $1}'`
if [ -z "$idA" ]; then
   echo "mysql-demo container was not started!"
   if [ -z "$idB" ]; then
      echo "container with name 'mysql-demo' was not exists!"
      exit
   else
      echo "it needs to rename container name;"
      docker rename mysql-demo mysql-demo_$Time
      cd /home/docker/workspace
      rm -rf mysql-demo
      echo "mysql-demo data dir was deleted!"
      cp -rf mysql-dev mysql-demo
      echo "copied data dir from mysql-dev to mysql-demo~"
      docker run -idt --privileged=true --restart=always --name mysql-demo -p3308:3306  -v /home/docker/workspace/mysql-demo:/var/lib/mysql  -e MYsql_ROOT_PASSWORD=adccadcc mysql:5.7
      echo "mysql-demo was started! And new container was created!"
      docker ps |grep mysql-demo
   exit
   fi 
  exit
else
   docker stop mysql-demo
   echo "mysql-demo container was stopped!"
   docker rename  mysql-demo mysql-demo_$Time
   echo "mysql-demo container was moved!"
   cd /home/docker/workspace
   rm -rf mysql-demo
   echo "mysql-demo data dir was deleted!"
   cp -rf mysql-dev mysql-demo
   echo "copied data dir from mysql-dev to mysql-demo~"
   docker run -idt --privileged=true --restart=always --name mysql-demo -p3308:3306  -v /home/docker/workspace/mysql-demo:/var/lib/mysql  -e MYsql_ROOT_PASSWORD=adccadcc mysql:5.7
   echo "mysql-demo was started! And new container was created!"
   docker ps |grep mysql-demo
   exit
fi
