import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
img1=""
img2=""
#初始化读取数据
key1="地址"
listarr=lilyfun.readjson()
#print(listarr.keys())
lilyfun.checkkey(listarr,key1)
img1=listarr[key1]
#img2=listarr['手机后4位']

#fv=firstval(listarr)
print(img1 +"--"+ img2)

#----------------2.数据提交并返回数组-------------------

from aip import AipNlp

""" 你的 APPID AK SK """
APP_ID = '25378293'
API_KEY = 'ooNPzuWNmoa9935hK1NYkzo8'
SECRET_KEY = 'hixZ4flktlAL458UETF8DWCvBTvHyGrj'

# -*- coding: utf-8 -*-
#!/usr/bin/env python

import urllib
import base64
import json
import time
#client_id 为官网获取的AK， client_secret 为官网获取的SK
client_id ="ooNPzuWNmoa9935hK1NYkzo8"
client_secret ='hixZ4flktlAL458UETF8DWCvBTvHyGrj'

#获取token
def get_token():
    host = 'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=' + client_id + '&client_secret=' + client_secret
    request = urllib.request.Request(host)
    request.add_header('Content-Type', 'application/json; charset=UTF-8')
    response = urllib.request.urlopen(request)
    token_content = response.read()
    #print (token_content)
    if token_content:
        token_info = json.loads(token_content)
        token_key = token_info['access_token']
    return token_key


text=img1
#text = "马云13800138000杭州市滨江区网商路699号310052"
""" 调用地址识别接口 """

def address(content):
    token=get_token()
    url = 'https://aip.baidubce.com/rpc/2.0/nlp/v1/address'
    params = dict()
    params['text'] = content
    params = json.dumps(params).encode('utf-8')
    access_token = token
    
    begin = time.perf_counter()
    url = url + "?access_token=" + access_token
    request = urllib.request.Request(url=url, data=params)
    request.add_header('Content-Type', 'application/json')
    response = urllib.request.urlopen(request)
    content = response.read().decode('utf-8')
    
    end = time.perf_counter()
    print('处理时长:'+'%.2f'%(end-begin)+'秒')
    
    if content:
        content=content
        data = json.loads(content)
        #print ('原文')
        #print ('省：',data['text'])
        print(data)
    return data

arr=address(text);



print(arr)
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr,"all")

