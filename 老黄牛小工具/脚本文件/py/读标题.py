import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
img1=listarr['url']

#print(listarr['录取照片路径'])
#print(listarr['入学照片路径'])
#fv=firstval(listarr)
print(img1 +"--")
#----------------2.数据提交并返回数组-------------------



#urllib2是python自带的模块，在python3.x中被改为urllib.request
import urllib.request
import re

page = urllib.request.urlopen(img1)
html = page.read().decode('utf-8')
# Python3 findall数据类型用bytes类型
# or html=urllib.urlopen(url).read()

title=re.findall('<title>(.+)</title>',html)
txt=title

arr2save={}
arr2save['网页标题']=txt
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")


