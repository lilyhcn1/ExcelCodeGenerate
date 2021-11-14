import lilyfun  #导入同路径下的函数
#----------------1.初始化读取数据----------------------
arr={}
#初始化读取数据
listarr=lilyfun.readjson()
#print(listarr)
excelpath=lilyfun.readjson("excelpath")
replace_dict = listarr





#mb=r"D:\老黄牛小工具\word模板\校车信封.docx"



import os
from docx import Document

def check_and_change(document, replace_dict):
    """
    遍历word中的所有 paragraphs，在每一段中发现含有key 的内容，就替换为 value 。 
    （key 和 value 都是replace_dict中的键值对。）
    """
    for para in document.paragraphs:
        for i in range(len(para.runs)):
            for key, value in replace_dict.items():
                if key in para.runs[i].text:
                    #print(key+"-->"+value)
                    para.runs[i].text = para.runs[i].text.replace(key, value)
    return document



# 放了一些docx 文件
old_file = listarr["模板名"]
#old_file=lilyfun.MBPATH+"\\"+listarr["模板名"]+".docx"
# 生成新文件后的存放地址
new_file = excelpath+"\\"+listarr["生成名"]
lilyfun.mkdir(new_file)  #保证目录的存在
print(old_file+"=>"+new_file)
replace_dict = listarr



document = Document(old_file)
document = check_and_change(document, replace_dict)
document.save(new_file)
print("^"*30)
#input()



