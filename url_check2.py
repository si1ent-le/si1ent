# coding:utf-8
# Author:si1ent
# Date:2019/10/15
# 此脚本主要用于检测某个网页内的死链接,较为简单.
import requests
from bs4 import BeautifulSoup
url = raw_input("URL:")
res = requests.get(url)
soup = BeautifulSoup(res.text, 'lxml')
print soup
for a in soup.find_all('a'):
    print (a['href'])

#print ("Please input URL")
