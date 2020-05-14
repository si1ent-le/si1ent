#!/bin/bash
#Author:si1ent
#Date:5/14

#通过netstat统计当前连接服务器IP以/16网段形式除输出

for i in `netstat -ntu|awk '{print $5}'|cut -d: -f1 -s |cut -f1,2,3 -d'.'|sed 's/$/.0/'|sort|uniq -c|sort -nk1 -r | awk '{if($1 > 100) {print $2}}'`; do

echo $ip_list;

/sbin/iptables -F
/sbin/iptables -A INPUT -p tcp --dport 22 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 22 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 3306 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 6379 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 6379 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 8888 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 8888 -j ACCEPT

#分别添加16、24网段进行封堵
/sbin/iptables -A INPUT -p tcp --dport 80 -j DROP -s $i/16
/sbin/iptables -A INPUT -p tcp --dport 80 -j DROP -s $i/24

done

