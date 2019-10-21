# coding:utf-8
# Author:si1ent
# socket实现端口扫描
# 端口号只能指定范围实现

import socket

ip = raw_input("Please Input IP:")
def ip_port_status(ip, port):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        server.connect((ip, port))
        print('{0} port {1} is open'.format(ip, port))
    except Exception as err:
        #print('{0} port {1} is not open'.format(ip, port))
        return
    finally:
        server.close()

if __name__ == "__main__":
    for port in range(80, 90):
        ip_port_status(ip, port)
