#!/usr/bin/env python
# -*- coding: utf-8 -*-
from urllib import request
import urllib.parse
import os,os.path,json
import requests
import time
MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'



#这里替换成常用函数
def savearr2json(arr,wtype="key"):
    with open(JSONFILE, 'w') as file_object:
        sc=os.path.splitext(os.path.basename(__file__))[0]
        arr2={}
        arr2['script']=sc
        arr2['w']=wtype
        arr2['content']=arr
        file_object.write(json.dumps(arr2))
        
def savestr(str):
    with open(JSONFILE, 'w') as file_object:
        file_object.write(str)

def readjson():
    with open(JSONFILE,'r',encoding='utf8') as f:
        ct = f.read()
        if ct.startswith(u'\ufeff'):
            ct = ct.encode('utf8')[3:].decode('utf8')
            ct = ct.replace('\\','\\\\')
    jsonarr = json.loads(ct)
    listarr = jsonarr['contents']
    return listarr
def firstval(arr):
    for index in arr:
        return arr[index]

arr={}
#初始化读取数据
listarr=readjson()
print(listarr)
fv=firstval(listarr)
#-----------------------------------------------------


keywords=fv
print(keywords)
url = "http://api.r34.cc/index.php/Qwadmin/LilyApi/num_to_rmb?num=" + keywords

print(url)
#11
response = request.urlopen(url) 
page = response.read().decode('utf-8')
print(page)
rjson=json.loads(page)

arr["大写金额"]=rjson['rmb']
#-----------------------最终写入数据---------------------
savearr2json(arr)



