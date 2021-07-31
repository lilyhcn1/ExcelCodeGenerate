import os
 
import win32api
import win32com
import win32print
from self import self
from win32com.client import Dispatch
import os
 
import win32api
import win32com
import win32print
from self import self
from win32com.client import Dispatch
# --------------------------------------------------------
# -- 需要修改的参数
# --------------------------------------------------------
# 获取当前工作目录(仅在测试中使用，具体使用可以注释掉，并修改open_file为要打开的word文档地址即可)
path = os.getcwd() + r'/Aine.docx'
# 要打开的文件
open_file = r"d:\temp\座位牌.docx"

 
# 方法二，通过win32com的方式进行打印
def print_word(word_file_path):
    # 指示系统中文档的处理工具
    # 指示运行的版本，如果是WPS应修改为
    # 如果使用word
    exec_tool = 'Word.Application'
    # 如果使用wps
    # exec_tool = 'wps.application'
    word = win32com.client.Dispatch(exec_tool)
    # 在后台运行程序
    word.Visible = 0  # 后台运行，不显示
    # 运行过程不警告
    word.DisplayAlerts = 0  # 不警告
    # 打开word文档
    doc = word.Documents.Open(word_file_path)
    # 进行打印
    doc.PrintOut()
    # --------------------------------------------------------
    # -- 最后操作保存
    # --------------------------------------------------------
    # 关闭文件
    doc.Close()
    # 退出word
    word.Quit()
 

# 方法二调用并进行打印

print_word(open_file)
