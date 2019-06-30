docker stop redis-cluster-master
docker stop redis-cluster-slave_1
docker stop redis-cluster-slave_2
docker stop redis-cluster-sentinel_1
docker stop redis-cluster-sentinel_2
docker stop redis-cluster-sentinel_3
docker rm $(docker ps -a|grep redis-cluster)
