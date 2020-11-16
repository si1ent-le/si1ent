# coding:utf-8
# Author:si1ent
# py3 实现pycharm代理至burpsuite；主要proxies参数；

import requests

proxies = {'http': 'http://127.0.0.1:8080',
           'https': 'https://127.0.0.1:8880'}

response = requests.get('http://www.si1ent.xyz/', proxies=proxies)

print(response.status_code)
