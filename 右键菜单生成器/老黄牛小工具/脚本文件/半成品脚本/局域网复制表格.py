#!/usr/bin/env python
# -*- coding: utf-8 -*-
import win32com,os
from win32com.client import Dispatch, constants
import psutil
import pytest
import time
import json

copyrows =3000
startrows =1
endcol =99

def SheetCopys(path1,path2,runmacro="UpdateBySheet",w1_sheet="sheet1",w2_sheet="sheet1"):
    xlApp = win32com.client.Dispatch("Excel.Application")
    xlApp.Visible = True
    xlApp.DisplayAlerts = 0
    #第一个文件
    xlBook = xlApp.Workbooks.Open(path1,False)
    sht = xlBook.Worksheets(w1_sheet)  #找到要操作的sheet
    sht.Activate
    sht.Application.Run(runmacro) #宏
    sht.Select()
    range_list=sht.Range(sht.Cells(1, 1), sht.Cells(copyrows, endcol)).Value
    xlBook.Close(True)
    
     #第二个文件       
    xlBook = xlApp.Workbooks.Open(path2,False)
    sht = xlBook.Worksheets(w2_sheet)  #找到要操作的sheet
    sht.Activate
    sht.Select()
    sht.Range(sht.Cells(0+startrows, 1), sht.Cells(copyrows+startrows-1, endcol)).Value = range_list
    xlBook.save
    xlBook.Close(True)
    #xlApp.quit()
    os.system('start /min taskkill /im et.exe')
    os.system('start /min taskkill /im excel.exe')


#读取数据
#wb1=openpyxl.load_workbook(r'\\192.168.7.61\e\111.xlsx')
#wb2=openpyxl.load_workbook('test.xlsx')
path1=r"D:\老黄牛小工具\脚本文件\测试\2222.xlsm"
path2=r"D:\老黄牛小工具\脚本文件\测试\test.xlsx"
SheetCopys(path1,path2)
