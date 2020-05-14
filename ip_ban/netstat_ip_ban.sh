#!/bin/bash
#Author:si1ent
#Date:5/14

#通过netstat统计当前连接服务器IP以/16网段形式除输出

netstat -ntu|awk '{print $5}'|cut -d: -f1 -s |cut -f1,2,3 -d'.'|sed 's/$/.0/'|sort|uniq -c|sort -nk1 -r | awk '{if($1 > 1) {print $2}}'
