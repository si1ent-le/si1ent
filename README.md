## DDOS防护基础脚本
提前配置好关于22、3306等对外提供服务端口，

配置22端口，其他一致
```
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
```
配置完成后，使用ab实现

