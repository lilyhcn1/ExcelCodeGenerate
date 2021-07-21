#!/usr/bin/env python
# -*- coding:utf-8 -*-
# https://www.jb51.net/article/180307.htm
import os,json
import win32com
from win32com.client import Dispatch
import time
import win32com.client

MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
# 处理Word文档的类

class Word:
    def __init__(self,visible=0,screenupdating=0):
        pythoncom.CoInitialize()
        self.app=gencache.EnsureDispatch(WORD)
        self.app.Visible = visible
        self.app.DisplayAlerts = 0
        self.app.ScreenUpdating = screenupdating
        print 'Starting word'
    def open(self,doc):
        self.opendoc=os.path.basename(doc)
        self.app.Documents.Open(FileName=doc)
    def replace(self,source,target):
        if target=='':target=' '
        alltext=self.app.Documents(self.opendoc).Range(Start=0,End=self.app.Documents(self.opendoc).Characters.Count) #select all
        alltext.Find.Text = source
        alltext.Find.Replacement.Text = target
        alltext.Find.Execute(Replace=1,Forward=True)
        #Special handling to do replace in text boxes
        #http://word.tips.net/Pages/T003879_Updating_a_Field_in_a_Text_Box.html
        for shp in self.app.Documents(self.opendoc).Shapes:
            if shp.TextFrame.HasText:
                shp.TextFrame.TextRange.Find.Text = source
                shp.TextFrame.TextRange.Find.Replacement.Text = target
                shp.TextFrame.TextRange.Find.Execute(Replace=1,Forward=True)

#My Usage
word=Word(visible=1,screenupdating=1)
word.open(r'd:\temp\座位牌.docx')
word.replace('[PGN]','1')
