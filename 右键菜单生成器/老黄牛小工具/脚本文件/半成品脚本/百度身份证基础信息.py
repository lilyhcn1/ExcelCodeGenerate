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



#交付方式：
#AccessKey：a9de61dfb5fd40c0b05e2189cdba710a    AppSecret：d987aaeb01214519b2610342d6a32fe9
#AppCode：9234cad5d4bf4e4fa31c855587f25491调试工具：

url='http://idcardqueryocr.api.bdymkt.com/idquery'
params = {
    "idNumber":'331082198311230312'}

headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'X-Bce-Signature': 'AppCode/9234cad5d4bf4e4fa31c855587f25491'
}
r = requests.request("POST", url, params=params, headers=headers)
print(r)
print(r.content)

