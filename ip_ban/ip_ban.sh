#!/bin/bash
#Author:si1ent
#Date:5/5
#主要检测当前连接服务器出现“TIME_WAIT”超过指定数量后会被拦截

# netstat -antup|grep SYN_RECV|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c

for i in ` netstat -an | grep -i ':80 ' | grep 'TIME_WAIT' | awk '{print $5}' | cut -d : -f 1 | sort | uniq -c | awk '{if($1 > 50) {print $2}}'`; do
  echo $i
  echo $i >> /tmp/banip

# iptables提前配置,以防后面无法访问,保证以上条件满足后才会执行后续添加
  /sbin/iptables -F
  /sbin/iptables -A INPUT -p tcp --dport  22 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  8888 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 8888 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  3306 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  443 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  21 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 21 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  8080 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 8080 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  6379 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 6379 -j ACCEPT
  /sbin/iptables -A INPUT -p tcp --dport  1433 -j ACCEPT
  /sbin/iptables -A OUTPUT -p tcp --sport 1433 -j ACCEPT
#  /sbin/iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#  /sbin/iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
# 出现TIME_WAIT且超过指定条数会被添加到iptables
  /sbin/iptables -A INPUT -p tcp -j DROP -s $i
done
