import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
img1=listarr['文件绝对路径']
img2=listarr['文件名称']
#print(listarr['录取照片路径'])
#print(listarr['入学照片路径'])
#fv=firstval(listarr)
print(img1 +"--"+ img2)
#----------------2.数据提交并返回数组-------------------



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
TEMPJPG=r'D:/老黄牛小工具/ExcelQuery/temp/temp.jpg'
SCREENEREXE=r'd:/老黄牛小工具/小工具/360screener.exe'
NCONVERTEXE=r'D:/老黄牛小工具/小工具/缩小图片nconvert/nconvert.exe'




from aip import AipOcr
""" 你的 APPID AK SK """
APP_ID = '24651834'
API_KEY = 'PFCyfV2U9ahzeSzssxEen2RF'
SECRET_KEY = 'sOIEY5DDadUF1GbE53DndEl9prRrZX2q'
client = AipOcr(APP_ID, API_KEY, SECRET_KEY)

image = lilyfun.get_file_content(img1)

""" 调用通用文字识别, 图片参数为本地图片 """
txt=""
aa=client.basicGeneral(image);
#print(aa)

ocrtxtarr=aa["words_result"]
#print(ocrtxtarr)
for arr in ocrtxtarr:
    #print(arr)
    txt=txt+arr['words']+"\n"

arr2save={}
arr2save['ocr结果']=txt
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")


