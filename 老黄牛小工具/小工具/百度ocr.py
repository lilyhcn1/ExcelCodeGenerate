import sys
sys.path.append('D:\\老黄牛小工具\\脚本文件')
import r34fun


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

def savesttxt(str,path=TEMPTEXT):
    with open(path, 'w') as file_object:
        file_object.write(str)

""" 读取图片 """
def get_file_content(filePath):
    with open(filePath, 'rb') as fp:
        return fp.read()
    
import win32con
import win32gui
import time




# 查找窗口句柄并最小化
hwnd = win32gui.FindWindow("ConsoleWindowClass", u"C:\\Windows\\py.exe")
print(hwnd)
if hwnd != 0:
    win32gui.ShowWindow(hwnd, win32con.SW_SHOWMINIMIZED)
#time.sleep(99)



import win32api
win32api.ShellExecute(0, 'open', 'D:\\老黄牛小工具\\小工具\\截图并保存为临时文件.vbs', '','',0)#打开记事本后台运行

'调用截图程序截图到剪贴板
Set oShell = CreateObject("WSCript.shell")


win32api.ShellExecute(0, 'open', 'D:\\老黄牛小工具\\小工具\\截图并保存为临时文件.vbs', '','',0)

win32api.ShellExecute("D:\老黄牛小工具\小工具\360screener.exe", 1, True)
'把剪贴板的图象保存为jpg文件
exeurl = "D:\老黄牛小工具\小工具\缩小图片nconvert\nconvert.exe -out jpeg -clipboard -overwrite -o " & tempjpg
'Call Shell(exeurl, 0)
ret = oShell.Run(exeurl, 0, True)
'强制关闭截图程序
ret = oShell.Run( "cmd.exe /c /min taskkill /IM 360screener.exe /F",0,True)





from aip import AipOcr
""" 你的 APPID AK SK """
APP_ID = '24651834'
API_KEY = 'PFCyfV2U9ahzeSzssxEen2RF'
SECRET_KEY = 'sOIEY5DDadUF1GbE53DndEl9prRrZX2q'
client = AipOcr(APP_ID, API_KEY, SECRET_KEY)
time.sleep(3)

image = get_file_content(TEMPJPG)

""" 调用通用文字识别, 图片参数为本地图片 """
aa=client.basicGeneral(image);
print(aa)
time.sleep(3)
savesttxt(aa,TEMPTEXT)
os.popen(TEMPTEXT)
time.sleep(3)




