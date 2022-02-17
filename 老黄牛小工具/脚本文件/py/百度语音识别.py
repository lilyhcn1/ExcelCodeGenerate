import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
img1=listarr['文件地址']
#img2=listarr['文件名称']
#print(listarr['录取照片路径'])
#print(listarr['入学照片路径'])
#fv=firstval(listarr)
#print(img1 +"--"+ img2)
#----------------2.数据提交并返回数组-------------------



from urllib import request
import urllib.parse
import os,os.path,json,sys
import requests
import time


from aip import AipSpeech
""" 你的 APPID AK SK """
APP_ID = '10330658'
API_KEY = 'r5ariWB9htPUkbmt9y4CzjGG'
SECRET_KEY = 'hu8k6fQl0BlbEqmXrIZlqANyKKeKKIRM  '

client = AipSpeech(APP_ID, API_KEY, SECRET_KEY)

# 读取文件
def get_file_content(file_path):
    with open(file_path, 'rb') as fp:
        return fp.read()
# 识别本地文件
result = client.asr(get_file_content(img1), 'wav', 16000, {
    'dev_pid': 1537,  # 默认1537（普通话 输入法模型），dev_pid参数见本节开头的表格
})

print(result)
vv=""
arr2save={}
bb=result['result']
for v in bb:
    vv=vv+v
arr2save["识别结果"]=vv
print(arr2save)
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")
