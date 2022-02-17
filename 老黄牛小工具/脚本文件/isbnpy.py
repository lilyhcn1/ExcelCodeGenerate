#!/usr/bin/env python
# -*- coding:utf-8 -*-
# https://www.jb51.net/article/180307.htm
import os,json
import win32com
from win32com.client import Dispatch
import shutil
import tempfile
import urllib.request


MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
# 处理Word文档的类

#这里替换成常用函数
def savejson(arr):
    with open(JSONFILE2, 'w') as f:
        f.write(json.dumps(arr))
        
def savestr(str1):
    with open(JSONFILE2, 'w') as f:
        f.write(str1)
        

# https://api.jisuapi.com/isbn/query?appkey=1e4603f9605bebea&isbn=9787212058937

if __name__ == '__main__':
    with open(JSONFILE,'r',encoding='utf8') as f:
        ct = f.read()
        if ct.startswith(u'\ufeff'):
            ct = ct.encode('utf8')[3:].decode('utf8')
        jsonarr = json.loads(ct)
        listarr = jsonarr['contents']
        n=0
        
    
    # 这里演示替换内容，其他功能自己按照上面类的功能按需使用
    for arr1   in listarr:
        print(arr1)
        isbn=arr1['isbn']
        appkey=arr1['appkey']
        url="https://api.jisuapi.com/isbn/query?appkey="+ appkey + "&isbn=" + isbn
        print(url)
        print("-------------")
        savestr(url)
        with urllib.request.urlopen(url) as response:
            html = response.read()
            str2 = html.decode(encoding='utf-8')
            str3=json.loads(str2)
            print(str3)
            outstr=json.dumps(str3['result'])
            print(outstr)


    savestr(outstr)

    


    
    

