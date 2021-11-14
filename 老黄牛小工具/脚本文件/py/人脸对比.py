#!/usr/bin/env python
# -*- coding: utf-8 -*-
from urllib import request
import urllib.parse
import os,os.path,json,sys
import requests
import time
import base64
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
        #print("input: "+ inputstr)
    return inputstr

def readimg2base64(filepath=""):
    with open(filepath, 'rb') as fp:
        data = fp.read()
    return base64.b64encode(data)


def upload(path):
    headers = {'Authorization': 'W2v89ImTEPqkCVr03dpRfW3wvjwbHyjj'}
    files = {'smfile': open(path, 'rb')}
    url = 'https://sm.ms/api/v2/upload'
    res = requests.post(url, files=files, headers=headers).json()
    aa=json.dumps(res, indent=4)
    aa=json.loads(aa)
    successstr = aa['success']
    #print(successstr)
    if  successstr == False:
        imageurl=aa['images']
    elif successstr == True:
        imageurl=aa['data']['url']
    else:
        print('error')
    return imageurl


arr={}
#初始化读取数据
listarr=readjson()
img1=listarr['录取照片路径']
img2=listarr['入学照片路径']
#print(listarr['录取照片路径'])
#print(listarr['入学照片路径'])
fv=firstval(listarr)
#-----------------------------------------------------



from aip import AipFace
import base64
""" 你的 APPID AK SK """
APP_ID = '24920833'
API_KEY = 'LKKZIXjcVyE5wGwSTVk3Qc5K'
SECRET_KEY = 'Yw6TekUkAUK4erTc8biiRIVXCZZ4kcfQ'

client = AipFace(APP_ID, API_KEY, SECRET_KEY)
res = client.match([
    {
        'image': str(base64.b64encode(open(img1, 'rb').read()), 'utf-8'),
        'image_type': 'BASE64',
    },
    {
        'image': str(base64.b64encode(open(img2, 'rb').read()), 'utf-8'),
        'image_type': 'BASE64',
    }
])
arr['相似度']=res["result"]['score']
print(arr)
savearr2json(arr)
