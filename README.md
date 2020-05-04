# si1ent脚本
## DDOS防护

提前配置好关于22、3306等对外提供服务端口，
！！！一定先配置好其他端口，以防业务无法正常运行。
配置22端口，其他一致。
```
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
```
配置完成后，使用ab模拟用户请求。
```
ab -n 1000 -c 10 http://192.168.3.81/
```
iptables结果  
![](images/iptables.jpg)

## 端口状态监测

简单监测端口开放情况，主要适用于内网外网主机端口。
执行结果如下：
![](images/port_status.jpg)
