#!/usr/bin/env python
# -*- coding: utf-8 -*-
from urllib import request
import urllib.parse
import os,os.path,json,sys
import requests
import time
MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
TEMPTEXT=r'd:/老黄牛小工具/ExcelQuery/temp/temp.txt'


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


def savesttxt(str,path=TEMPTEXT):
    with open(path, 'w') as file_object:
        file_object.write(str)
def sysargv(inputstr=""):
    if len(sys.argv)>1:    #判断有没有参数
        n = len(sys.argv)
        temp=""
        for i in range(1, n):
            if i == 1 :
                temp = temp + sys.argv[i]
            else:
                temp = temp + sys.argv[i] +" "
        inputstr=temp
        print("input: "+ inputstr)
    return inputstr


def upload(path):
    exist = "0"
    while exist == "0":
        curlpath= 'D:\\老黄牛小工具\\ExcelQuery\\'
        exeurl=curlpath + 'curl.exe --upload-file ' + "\"" + inputstr  + "\"" +' https://transfer.sh >' +TEMPTEXT
        print(exeurl)
        os.system( exeurl)
        with open(TEMPTEXT, "r") as f:  # 打开文件
            res = f.read()  # 读取文件
            print(res)
        if "https://"  in res:
             exist= "1"
             resd=res.replace("https://transfer.sh","https://transfer.sh/get")
             resstr = "上传成功，并复制到剪贴板。网址如下：\n"
             resstr = resstr + "在线查看网址：" +res
             resstr = resstr+ "\n" +"直接下载网址：" +resd
             savesttxt(resstr,TEMPTEXT)
        time.sleep(1)
    return resd 

import pyperclip
#pyperclip.copy()



inputstr=sysargv(r"D:\老黄牛小工具\小工具\222.pdf")
print(inputstr)

if __name__ == "__main__":
    imageurl="test"
    #time.sleep(1)
    imageurl=upload(inputstr)
    pyperclip.copy(imageurl)
    print(imageurl)
    os.popen(TEMPTEXT)
    #time.sleep(3)
