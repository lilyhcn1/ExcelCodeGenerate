import urllib.parse
import sys,os

import win32con
import win32clipboard as wc
# 获取剪切板内容
def getCopy():
    wc.OpenClipboard()
    t = wc.GetClipboardData(win32con.CF_UNICODETEXT)
    wc.CloseClipboard()
    return t

# 写入剪切板内容
def setCopy(str):
    wc.OpenClipboard()
    wc.EmptyClipboard()
    wc.SetClipboardData(win32con.CF_UNICODETEXT, str)
    wc.CloseClipboard()
    
inputstr=' '.join(sys.argv[1:])
#inputstr=r"E:\Seafile\私人资料库\分类工作\科研_学术讲座\人文学术讲座.xlsm"
print(inputstr)
inputstr=inputstr.replace(r"E:\Seafile\私人资料库",'%lilyfolder%')
inputstr=inputstr.replace(r"D:\Seafile\私人资料库",'%lilyfolder%')
print(inputstr)
#pyperclip.copy(inputstr) 



    

setCopy(inputstr)
print(getCopy())
#a = input("input:")
#os.system('explorer.exe %s'+ data)
