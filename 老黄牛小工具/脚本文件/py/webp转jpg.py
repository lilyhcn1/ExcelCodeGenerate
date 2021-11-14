import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
#listarr=lilyfun.readjson()


#----------------2.数据提交并返回数组-------------------
import convertapi
import os
import tempfile
inputpatharr=lilyfun.sysargvandjson("webppath")
print("全部的输入值：")
print(inputpatharr)

#
for index,inputpath in inputpatharr.items():
    print("循环内部inputpath: " + inputpath)
    savepath=lilyfun.GetDesktopPath()+"\\新图片"
    lilyfun.mkdir(savepath)
    #print(savepath)
    #input("暂时中")
    convertapi.api_secret = 'RJiMxtyfD9RgiVhm'
    convertapi.convert('jpg', {
        'File': inputpath
    }, from_format = 'webp').save_files(savepath)
    #input()
    #print(arr)
#----------------3.数据写入json文件-------------------
#lilyfun.savearr2json(arr)




