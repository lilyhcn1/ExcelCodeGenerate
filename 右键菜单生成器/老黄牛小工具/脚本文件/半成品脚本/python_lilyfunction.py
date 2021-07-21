#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- 三思网络(r34.cc) -*-
import os,json
import win32com
import time
MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'



#这里替换成常用函数
def savejson(arr):
    with open(JSONFILE, 'w') as file_object:
        file_object.write(json.dumps(arr))
        
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
    listarr = jsonarr['contents'][0]
    return listarr
arr={}

    
