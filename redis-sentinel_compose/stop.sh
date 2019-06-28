docker stop redis-cluster_master
docker stop redis-cluster_slave_1
docker stop redis-cluster_slave_2
docker stop redis-cluster_sentinel_1
docker stop redis-cluster_sentinel_2
docker stop redis-cluster_sentinel_3
docker rm $(docker ps -a|grep redis-cluster)
