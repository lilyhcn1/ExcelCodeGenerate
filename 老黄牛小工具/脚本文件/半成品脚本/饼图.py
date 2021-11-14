import os,json
import json
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

MOBAN="模板"
GENPATH="生成文件夹"
JSONFILE=r'd:/老黄牛小工具/ExcelQuery/temp/temp.json'
JSONFILE2=r'd:/老黄牛小工具/ExcelQuery/temp/temp2.json'
with open(JSONFILE,'r',encoding='utf8') as f:
    ct = f.read()
    if ct.startswith(u'\ufeff'):
        ct = ct.encode('utf8')[3:].decode('utf8')
    jsonarr = json.loads(ct)
    listarr = jsonarr['contents']
    #listarr=jsonarr
    print(listarr)
    print("--------------")
    print("空")
    print("--------------")
    df = pd.json_normalize(listarr)
    plt.pie(df['数量'].astype(float))
    plt.show()

#df= pd.read_excel(r'E:\Seafile\私人资料库\1王进利私人资料\python\python_excel\order.xls', sheet_name='Sheet1')
#print(df)
#df['数量'].plot()
#plt.show()

