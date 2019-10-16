#!/bin/sh
location="/app/activemq/log/"
find $location -mtime +1 -type f |xargs rm -f



#!/bin/sh
#while true
#do
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
LOGFILE=/app/logs/lograr_$(date +%Y%m%d).log
function log()
{
    local Time=`date "+%Y-%m-%d %H:%M:%S"`
    echo "$Time $*" >> $LOGFILE
}
#########Start lograr.sh

log "###########Start lograr.sh."
#find /app/efpsServer/logs -mtime +1 -type f|xargs tar -czPf /app/lograr/efpsSever_log_$(date +%Y%m%d-%H%M).tar.gz --remove-files >> $LOGFILE 2>&1;
#find /app/parkingStandServer/logs -mtime +1 -type f|xargs tar -czPf /app/lograr/parkingStandServer_log_$(date +%Y%m%d-%H%M).tar.gz --remove-files >> $LOGFILE 2>&1;
find /app/logs -mtime +1 -type f|xargs tar -czPf /app/logzip/process_monitor_log_$(date +%Y%m%d-%H%M).tar.gz --remove-files >> $LOGFILE 2>&1;



