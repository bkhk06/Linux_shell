
current_date=$(date +%Y%m%d)
echo $current_date
docker commit mysql-dev mysql/demo:$current_datedo

docker stop mysql-demo
current_time=$(date +%Y-%m-%d)
echo $current_time
docker rename mysql-demo mysql-demo_$current_time

docker run -idt --privileged=true --restart=always --name mysql-demo -p3309:3306  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:$current_date

docker run -idt --privileged=true --restart=always --name mysql-demo -p3309:3306  -v /home/docker/workspace/mysql-dev:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:$current_date





docker run -idt --privileged=true --restart=always --name mysql-dev -p3307:3306  -v /home/docker/workspace/mysql-dev:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/dev:5.7


docker/mongo
docker run -idt --privileged=true --restart=always --name mongo -p28017:27017  -v /home/docker_workspace/mongodb:/data/db  mongo:latest

docker run -idt --privileged=true --restart=always --name mongo-express -p 8981:8081 --link mongo:mongo mongo-express:latest

docker run -idt --privileged=true --restart=always --name mongo-client -p 3100:3000 -e MONGO_URL=mongodb://192.168.11.102:22017/ mongoclient/mongoclient:latest

docker/redis
docker run -idt --privileged=true --restart=always --name redis -p6479:6379  -v /home/docker_workspace/redis:/data  redis:latest redis-server --appendonly yes

docker exec -i mysql-dev sh -c 'exec mysql -uroot -padccadcc efs_fdp_v1' < efs_fdp_v1_20190617160604.sql



docker run -idt --privileged=true --restart=always --name mysql-demo -p3308:3306  -v /home/docker/workspace/mysql-demo:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:5.7

docker exec -i mysql-demo sh -c 'exec mysql -uroot -padccadcc efs_fdp_v1' < efs_fdp_v1_20190617160604.sql


docker run -idt --privileged=true -v /etc/localtime:/etc/localtime --restart=always --name mysql-learning -p3310:3306  -v /home/docker/workspace/mysql-learning:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:5.7

docker run -idt --privileged=true -v /etc/localtime:/etc/localtime --restart=always --name mysql-dev -p3307:3306  -v /home/docker/workspace/mysql-dev:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:5.7

docker run -idt --privileged=true -v /etc/localtime:/etc/localtime --restart=always --name mysql-test -p3308:3306  -v /home/docker/workspace/mysql-test:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:5.7


docker run -idt --privileged=true -v /etc/localtime:/etc/localtime --restart=always --name mysql-demo -p3309:3306  -v /home/docker/workspace/mysql-demo:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:5.7




docker run -idt --privileged=true --restart=always --name mysql-demo -p3309:3306  -v /home/docker/workspace/mysql-dev:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo

docker run -idt --privileged=true --restart=always --name mysql-demo -p3309:3306  -v /home/docker/workspace/mysql-dev:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo





# 主库
 docker run -it --name redis-master -d -p 6300:6300 redis redis-server --requirepass adccadcc --port 6300
 docker exec -it redis-master bash
 redis-cli -a adccadcc -p 6300
 config set masterauth adccadcc
 # 从库1
 docker run -it --name redis-slave -d -p 6301:6301 redis redis-server --requirepass adccadcc --port 6301
 docker exec -it redis-slave bash
 redis-cli -a adccadcc -p 6301
 slaveof 192.168.11.102 6300
 config set masterauth adccadcc
 
 # 从库2
 docker run -it --name redis-slave2 -d -p 6302:6302 redis redis-server --requirepass adccadcc --port 6302
 docker exec -it redis-slave2 bash
 redis-cli -a adccadcc -p 6302
 slaveof 192.168.11.102 6300
 config set masterauth adccadcc


# redis-sentinel实例1
 docker run -it --name redis-sentinel1 -v /home/docker_workspace/redis-sentinel/sentinel1.conf:/usr/local/etc/redis/sentinel.conf -d redis /bin/bash
 
 # redis-sentinel实例2
 docker run -it --name redis-sentinel2 -v /home/docker_workspace/redis-sentinel/sentinel2.conf:/usr/local/etc/redis/sentinel.conf -d redis /bin/bash
 
 # redis-sentinel实例3
 docker run -it --name redis-sentinel3 -v /home/docker_workspace/redis-sentinel/sentinel3.conf:/usr/local/etc/redis/sentinel.conf -d redis /bin/bash















#!/bin/sh
Date=$(date +"%Y%m%d")
Time=$(date +"%Y%m%d%H%m%S")
#echo $Date
#echo $Time

docker exec -it  mysql-dev mysqldump -uroot -padccadcc efs_fdp_v1  > efs_fdp_v1_$Time.sql
#docker exec  mysql-dev sh -c 'exec mysqldump --all-databases -uroot -padccadcc"' > efs_fdp_v1_demo_$Time.sql
echo "efs_fdp_v1 downloading from mysql-dev is done!"

#docker exec -i mysql-demo mysqldump -uroot -padccadcc efs_fdp_v1 < efs_fdp_v1_$Time.sql
docker exec -i mysql-demo sh -c 'exec mysql -uroot -padccadcc efs_fdp_v1' < efs_fdp_v1_$Time.sql
echo "efs_fdp_v1 uploading to mysql-demo is done!"

#docker commit mysql-dev mysql/demo:$Date

#docker stop mysql-demo

#docker rename mysql-demo mysql-demo_$Time

#docker run -idt --privileged=true --restart=always --name mysql-demo -p3309:3306  -e MYSQL_ROOT_PASSWORD=adccadcc mysql/demo:$Date
