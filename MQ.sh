#!/bin/sh
#
# /etc/init.d/activemq
# chkconfig: 345 63 37
# description: activemq servlet container.
# processname: activemq 5.14.1

# Source function library.
#. /etc/init.d/functions
# source networking configuration.
#. /etc/sysconfig/network

#export JAVA_HOME=/usr/local/jdk1.6.0_45/
export CATALINA_HOME=/home/app/activemq_ADC

case $1 in
    start)
        sh $CATALINA_HOME/bin/activemq start
    ;;
    stop)
        sh $CATALINA_HOME/bin/activemq stop
    ;;
    status)
        sh $CATALINA_HOME/bin/activemq status
    ;;
    restart)
        sh $CATALINA_HOME/bin/activemq stop
        sleep 1
        sh $CATALINA_HOME/bin/activemq start
    ;;

esac
exit 0