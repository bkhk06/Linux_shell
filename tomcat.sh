#!/bin/bash
#############################################
. /etc/init.d/functions
. /etc/profile
#set env
export PATH=$PATH:/bin:/sbin:/usr/sbin
export LANG="zh_CN.GB18030"
 
# Require root to run this script.
if [[ "$(whoami)" != "root" ]]; then
      echo "Please run this script as root." >&2
      exit 1
fi

Tomcat_Home=/usr/local/apache-tomcat-8.5.29/ 
# Source function library.
#. /etc/init.d/functions
if [ ! -f $Tomcat_Home/bin/startup.sh ]
        then
            echo "tomcat is not exit.please install."
            exit 1
fi
#This is a function for start tomcat
function start(){
         if [ `ps -ef |grep java|grep -v grep|grep -v sh|wc -l` -eq 0 ]
               then
                 /bin/sh $Tomcat_Home/bin/startup.sh >/dev/null 2>&1
                     [ $? -eq 0 ]&&\
                     sleep 1
                     action "tmocat start." /bin/true
               else
                     action "tomcat had been startted." /bin/true
                     exit 3
         fi
}
#This is a function for stop tomcat
 function stop(){
         if [ `ps -ef |grep java|grep -v grep|grep -v sh|wc -l` -gt 0  ]
                 then
                         PID=`ps -ef |grep java|grep -v grep|awk '{print $2}'`
                         kill -9 $PID
                         [ $? -eq 0 ]&&\
                         echo "tomcat is stopping..."
                         sleep 1
                         action "tomcat  been stoped." /bin/true
                  else
                         action "tomcat had been stoped." /bin/true
                         exit 4
         fi
}
 #This is a function for restart tomcat
 function restart(){
         if [ `ps -ef |grep java |grep -v grep|grep -v sh|wc -l` -gt 0  ]
                then
                        PID1=`ps -ef |grep java|grep -v grep|awk '{print $2}'`
                        kill -9 $PID1
                        [ $? -eq 0 ]&&/bin/sh $Tomcat_Home/bin/startup.sh >/dev/null 2>&1
  
                        [ $? -eq 0 ]&&echo "tomcat is restarting..."
                        sleep 1
                         action "tomcat is restartted ." /bin/true
                 else
                         action "tomcat is not running,please start." /bin/true
                         exit 5
         fi
}
#This is a function for status tomcat
function status(){
         if [ `ps -ef |grep java |grep -v grep|wc -l` -gt 0  ]
                 then
                        action "tomcat is running."  /bin/true
                 else
                        action "tomcat is stopped." /bin/false
                        exit 5
         fi
}
case $1 in
         start)
         start
 ;;
         stop)
         stop
 ;;
         restart)
         restart
 ;;
         status)
         status
 ;;
 
         *)
        echo "USAG:start|stop|restart|status"
esac         