export JAVA_HOME=/usr/local/jdk1.6.0_45/
export JAVA_OPTS="-server -Xms2048m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=256m -XX:NewSize=768m -XX:MaxNewSize=768m"
cd $JBOSS_HOME/bin

ppid=`ps -ef | grep crs-cluster | grep -v grep | grep -v /bin/sh|awk '{print $2}'`

if [ -z "$ppid" ]; then
   nohup ./run.sh -c crs-master -g jboss-crs-cluster -u 239.255.17.100 -b 192.168.11.101 -Djboss.service.binding.set=ports-01 -Djboss.messaging.ServerPeerID=201 &
   echo "JBOSS-CRD is started..."
   exit
else
   echo "JBOSS-CRS is already running (pid $ppid)"
   exit
 fi

