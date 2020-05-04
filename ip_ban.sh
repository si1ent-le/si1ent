#!/bin/bash
#
for i in ` netstat -an | grep -i ':80 ' | grep 'TIME_WAIT' | awk '{print $5}' | cut -d : -f 1 | sort | uniq -c | awk '{if($1 > 50) {print $2}}'`; do
  echo $i
  echo $i >> /tmp/banip
  /sbin/iptables -A INPUT -p tcp -j DROP -s $i

done
