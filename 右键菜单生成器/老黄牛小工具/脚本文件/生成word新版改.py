#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os,json,time
MOBAN=r'd:\\老黄牛小工具\\word模板'
GENPATH=r'd:\\老黄牛小工具\\生成文件夹'
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'



#这里替换成常用函数
def savejson(arr):
    with open(JSONFILE, 'w') as file_object:
        file_object.write(json.dumps(arr))
        
def savestr(str):
    with open(JSONFILE, 'w') as file_object:
        file_object.write(str)
def readjson():
    with open(JSONFILE,'r',encoding='gbk') as f:
        ct = f.read()
        if ct.startswith(u'\ufeff'):
            ct = ct.encode('utf8')[3:].decode('gbk')
            ct = ct.replace('\\','\\\\')
    jsonarr = json.loads(ct)
    print(jsonarr)
    listarr = jsonarr
    return listarr
arr={}
#文件头部公共文件部分




import win32com
from win32com.client import Dispatch


class RemoteWord:
    def __init__(self, filename=None):
        #self.xlApp = win32com.client.Dispatch('Word.Application') # 此处使用的是Dispatch，原文中使用的DispatchEx会报错
        self.xlApp = win32com.client.DispatchEx('Word.Application') # 此处使用的是Dispatch，原文中使用的DispatchEx会报错
        self.xlApp.Visible = 0 # 后台运行，不显示
        self.xlApp.DisplayAlerts = 0  #不警告
        if filename:
            self.filename = filename
            if os.path.exists(self.filename):
                self.doc = self.xlApp.Documents.Open(filename)
            else:
                self.doc = self.xlApp.Documents.Add()  # 创建新的文档
                self.doc.SaveAs(filename)
        else:
            self.doc = self.xlApp.Documents.Add()
            self.filename = ''
  
    def add_doc_end(self, string):
        '''在文档末尾添加内容'''
        rangee = self.doc.Range()
        rangee.InsertAfter('\n' + string)
  
    def add_doc_start(self, string):
        '''在文档开头添加内容'''
        rangee = self.doc.Range(0, 0)
        rangee.InsertBefore(string + '\n')
  
    def insert_doc(self, insertPos, string):
        '''在文档insertPos位置添加内容'''
        rangee = self.doc.Range(0, insertPos)
        if (insertPos == 0):
            rangee.InsertAfter(string)
        else:
            rangee.InsertAfter('\n' + string)
  
    def replace_doc(self, string, new_string):
        '''替换文字'''
        self.xlApp.Selection.Find.ClearFormatting()
        self.xlApp.Selection.Find.Replacement.ClearFormatting()
        #(string--搜索文本,
        # True--区分大小写,
        # True--完全匹配的单词，并非单词中的部分（全字匹配）,
        # True--使用通配符,
        # True--同音,
        # True--查找单词的各种形式,
        # True--向文档尾部搜索,
        # 1,
        # True--带格式的文本,
        # new_string--替换文本,
        # 2--替换个数（全部替换）
        self.xlApp.Selection.Find.Execute(string, False, False, False, False, False, True, 1, True, new_string, 2)
  
    def replace_docs(self, string, new_string):
        '''采用通配符匹配替换'''
        self.xlApp.Selection.Find.ClearFormatting()
        self.xlApp.Selection.Find.Replacement.ClearFormatting()
        self.xlApp.Selection.Find.Execute(string, False, False, True, False, False, False, 1, False, new_string, 2)
    def save(self):
        '''保存文档'''
        self.doc.Save()
  
    def save_as(self, filename):
        '''文档另存为'''
        self.doc.SaveAs(filename)
  
    def close(self):
        '''保存文件、关闭文件'''
        self.save()
        self.xlApp.Documents.Close()
        self.xlApp.Quit()

if __name__ == '__main__':
    listarr=readjson()
    #print(listarr)
    # 这里演示替换内容，其他功能自己按照上面类的功能按需使用
    outpath=""
    os.system('start /min cmd /c TASKKILL /MIN /F /IM wps.exe')

    arr1=listarr
    #print(arr1)
    #print("-----------")
    mbname=arr1['模板名']
    outname=arr1['生成名']  
    excelpath=GENPATH
    wordmbpath=MOBAN
    path = wordmbpath + "\\" +mbname +".docx"
    outpath=os.getcwd() + "\\生成文件夹\\" +outname +".docx"
    print("path:"+path+"  \noutpath "+outpath)
    print("-----------")
    os.system('start /min cmd /c TASKKILL /MIN /F /IM wps.exe')
    #print(path)
    doc = RemoteWord(path)  # 初始化一个doc对象
        

    for key,value in arr1.items():
        #print("key:"+key+"  value "+value)
        doc.replace_doc(key, value)  # 替换文本内容
    doc.save_as(outpath)
    doc.close()


    #文件尾部生成文件
    arr['生成文件路径']=outpath
    savejson(arr)



    


    
    

