#!/bin/bash
location="/app/parkingStandServer/logs"
find $location -mtime +1 -type f|xargs tar -zcvf ../lograr/log-$($(date +%Y%m%d-%H%M).tar.gz)