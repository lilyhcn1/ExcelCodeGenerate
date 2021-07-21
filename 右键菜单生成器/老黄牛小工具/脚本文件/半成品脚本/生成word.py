#!/usr/bin/env python
# -*- coding:utf-8 -*-
# https://www.jb51.net/article/180307.htm
import os,json,time
import win32com
from win32com.client import Dispatch
MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
# 处理Word文档的类
def closesoft():
    wc=win32com.client.constants
    try:
        wps=win32com.client.gencache.EnsureDispatch('kwps.application')
    except:
        wps=win32com.client.gencache.EnsureDispatch('wps.application')
    else:
        wps=win32com.client.gencache.EnsureDispatch('word.application')
    try:
        wps.Documents.Close()
        wps.Documents.Close(wc.wdDoNotSaveChanges)
        wps.Quit
    except:pass
    
class RemoteWord:
    def __init__(self, filename=None):
        self.xlApp = win32com.client.Dispatch('Word.Application') # 此处使用的是Dispatch，原文中使用的DispatchEx会报错
        self.xlApp.Visible = 0 # 后台运行，不显示
        self.xlApp.DisplayAlerts = 0  #不警告
        if filename:
            self.filename = filename
            if os.path.exists(self.filename):
                self.doc = self.xlApp.Documents.Open(filename)
            else:
                self.doc = self.xlApp.Documents.Add()  # 创建新的文档
                time.sleep(1)
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
    with open(JSONFILE,'r',encoding='utf8') as f:
        ct = f.read()
        if ct.startswith(u'\ufeff'):
            ct = ct.encode('utf8')[3:].decode('utf8')
        jsonarr = json.loads(ct)
        listarr = jsonarr['contents']
    # 这里演示替换内容，其他功能自己按照上面类的功能按需使用
    for arr1   in listarr:
        #print(arr1)
        #print("-----------")
        mbname=arr1['模板名']
        outname=arr1['生成名']
        excelpath=jsonarr['excelpath']
        path = excelpath +"\\"+ MOBAN + "\\" +mbname +".docx"
        outpath=excelpath +"\\"+ GENPATH + "\\" +outname +".docx"
        path=path.replace("\\","/")
        outpath=outpath.replace("\\","/")
        print("path:"+path+"  \noutpath "+outpath)
        print("-----------")
        closesoft()
        doc = RemoteWord(path)  # 初始化一个doc对象
        for key,value in arr1.items():
            print("key:"+key+"  value "+value)
            doc.replace_doc(key, value)  # 替换文本内容
        doc.save_as(outpath)
        doc.close()

    
    

