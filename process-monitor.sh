#!/bin/sh
#while true
#do
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
LOGFILE=/app/logs/process_monitor_$(date +%Y%m%d).log
function log()
{
    local Time=`date "+%Y-%m-%d %H:%M:%S"`
    echo "$Time $*" >> $LOGFILE
}
#########Start efps_process_monitor.sh
log "###########Start efps_process_monitor.sh."
ps -ef | grep "efpsServer Application" | grep -v "grep" >> $LOGFILE 2>&1

if [ "$?" -eq 1 ]
   then
     #sh /opt/efpsStart.sh 
     service efps start >> $LOGFILE 2>&1
     log "efps has been restarted!"
   else
     log "efps already started!"
fi
#   sleep 10
#done

#########Start efps_process_monitor.sh

log "###########Start parkingStand_process_monitor.sh."
ps -ef | grep "ParkingStandProgramMain" | grep -v "grep" >> $LOGFILE 2>&1

if [ "$?" -eq 1 ]
   then
     #sh /opt/efpsStart.sh 
     service parkingstand start >> $LOGFILE 2>&1
     log "ParkingStandProgramMain has been restarted!"
   else
     log "ParkingStandProgramMain already started!"
fi

#########Start zookeeper_process_monitor.sh
log "###########Start zookeeper_process_monitor.sh."
ps -ef | grep "zookeeper.server" | grep -v "grep" >> $LOGFILE 2>&1

if [ "$?" -eq 1 ]
   then
     #sh /opt/efpsStart.sh 
     service zookeeper start >> $LOGFILE 2>&1
     log "zookeeper has been restarted!"
   else
     log "zookeeper already started!"
fi

