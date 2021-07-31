#!/usr/bin/env python
# -*- coding:utf-8 -*-
# https://www.jb51.net/article/180307.htm
import os,json
import win32com
from win32com.client import Dispatch
import json

MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
# 处理Word文档的类
  
fo=[{
    "path":JSONFILE2
    }]
with open(JSONFILE2, 'w') as file_object:
    file_object.write(json.dumps(fo))
    

