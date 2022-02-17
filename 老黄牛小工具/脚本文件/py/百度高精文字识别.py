import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
img1=listarr['文件绝对路径']
img2=""
#fv=firstval(listarr)
print(img1 +"--"+ img2)
#----------------2.数据提交并返回数组-------------------

JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'

from aip import AipOcr
APP_ID = "1"
API_KEY = listarr['API_KEY']
SECRET_KEY = listarr['SECRET_KEY']
client = AipOcr(APP_ID, API_KEY, SECRET_KEY)


image = lilyfun.get_file_content(img1)

""" 高精图片识别, 图片参数为本地图片 """
txt=""
txt2=""
aa=client.basicAccurate(image);

ocrtxtarr=aa["words_result"]
#print(ocrtxtarr)
for arr in ocrtxtarr:
    #print(arr)
    txt=arr['words']+"\n"+txt
    

print(txt)

arr2save={}
arr2save['ocr结果']=txt
#----------------3.数据写入json文件-------------------
lilyfun.savearr2json(arr2save,"key")


