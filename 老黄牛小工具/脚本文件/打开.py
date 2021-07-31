#!/usr/bin/env python
# -*- coding:utf-8 -*-
# https://www.jb51.net/article/180307.htm
import os,json
import win32com
from win32com.client import Dispatch
import time

MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'

if __name__ == '__main__':
    with open(JSONFILE,'r',encoding='utf8') as f:
        ct = f.read()
        ct = ct.replace('\\','\\\\')
        if ct.startswith(u'\ufeff'):
            ct = ct.encode('utf8')[3:].decode('utf8')
        jsonarr = json.loads(ct)
        listarr = jsonarr['contents'][0]

        openfile=""
        if '生成文件路径' in listarr:
            openfile=listarr['生成文件路径']
        elif '生成文件' in listarr:
            openfile=listarr['生成文件']
        elif '文件路径' in listarr:
            openfile=listarr['文件路径']
        

        if openfile != "":
            print(openfile)
            os.system('start /max '+ openfile)
        
 


    
    

