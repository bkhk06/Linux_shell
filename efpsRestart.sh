#!/bin/sh
#while true
#do
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
ps -ef | grep "efpsServer" | grep -v "grep"

if [ "$?" -eq 1 ]
   then
     service efps start 
     #echo "efpsServer has been restarted!"
   #else
     #echo "efpsServer already started!"
fi
#   sleep 10
#done
