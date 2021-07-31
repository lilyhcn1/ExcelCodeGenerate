#!/usr/bin/env python
# -*- coding: utf-8 -*-
    
MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
from urllib import request
import urllib.parse
import os,os.path,json
import requests
import time


with open(JSONFILE,'r',encoding='utf8') as f:
    ct = f.read()
    #print(ct)
    if ct.startswith(u'\ufeff'):
        ct = ct.encode('utf8')[3:].decode('utf8')
    jsonarr = json.loads(ct)
    print(jsonarr)
    #print("--------------")
    #print("空")
    #print("--------------")
    listarr = jsonarr['contents']
    keywords=listarr[0]['查询词']
    print(keywords)

url="http://restapi.amap.com/v3/place/text?key=26aa795b3f47e3cd309c0fa938d39650&keywords=" +urllib.parse.quote(keywords) + "&types=&city=&children=&offset=&page=&extensions=base"
#print(url)
#11
response = request.urlopen(url) 
page = response.read().decode('utf-8')

rjson=json.loads(page)['pois'][0]
with open(JSONFILE,'w') as f:    #设置文件对象
    f.write(json.dumps(rjson))                 #将字符串写入文件中


