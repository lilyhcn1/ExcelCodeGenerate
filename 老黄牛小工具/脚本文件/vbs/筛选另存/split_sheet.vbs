
' 拆分 Macro
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'https://www.cnblogs.com/qiyuexin/p/9955792.html
' 2.1 CreateObject Method
'     语法：CreateObject(appname.objectType, [servename])
'     解释：appname, 必要， Variant(字符串)。提供该对象的应用程序名。
'           objecttype, 必要，Variant。带创建对象的类型或是类。
'           servename，可选，Variant。要在其上创建对象的网络服务器名称。
'
'     说明：要创建ActiveX对象，只需将CreateObject返回的对象赋给一个对象变量：
'     例子：Set oExcel = CreateObject("Excel.Application")

' 声明一个对象变量，并使用动态创建方法创建该对象

Rem Wscript.echo test
Rem .SaveAs ThisWorkbook.Path & "/" & d.keys()(ss)
Dim oExcel
Set oExcel = CreateObject("Excel.Application")

' 1) 使Excel可见
oExcel.Visible = true

' 2) 更改Excel标题栏
oExcel.caption = "qyx's vbs"

' 3) 添加一个新的工作薄
Rem eExcel.workBooks.add

' 4) 打开已存在的工作薄
filePath="D:\桌面文件\汇报ppt  202111.11下午\筛选另存\假的通讯录.xlsx"
Rem filePath=document.getElementById("filePath").value
Rem keyColumn=document.getElementById("keyColumn").value
keyColumn=5
set wb=oExcel.workbooks.open(filePath)
currentPath=wb.Path
' 5) 设置第2个工作页为活动工作表
oExcel.worksheets(1).activate
' 或者
' oExcel.worksheets("").activate
'



Rem https://club.excelhome.net/forum.php?mod=viewthread&tid=1603945&highlight=%B9%A4%D7%F7%B1%ED%B2%F0%B7%D6&mobile=

Dim i

Rem arr = oExcel.Sheets(1).[a1].CurrentRegion
arr = wb.Sheets(1).[a1].CurrentRegion
set curr_sht=wb.Sheets(1)
Set d = CreateObject("scripting.dictionary")

For i = 2 To UBound(arr)
Rem 从第二行取数
If d.exists(arr(i, keyColumn)) Then
Rem 从第五列 拆分
Set d(arr(i, keyColumn)) =oExcel.Union(d(arr(i, 5)),curr_sht.Rows(i))

Else

Set d(arr(i, keyColumn)) =oExcel.Union(curr_sht.Rows("1:2"),curr_sht.Rows(i))
Rem 第一行 复制 表头

End If

Next

For ss = 0 To d.Count - 1

'Workbooks.Add
' 3) 添加一个新的工作薄
Rem oExcel.workBooks.add
Rem With oExcel.ActiveWorkbook
set new_wk=oExcel.Workbooks.Add
with new_wk
d.items()(ss).Copy .Sheets(1).[a1]
Rem https://m.yisu.com/zixun/403298.html
.SaveAs currentPath & "/" & d.keys()(ss)

.Close

End With

Next
' 使用应用程序对象的quit方法关闭Excel
oExcel.Quit

' 释放该对象变量
Set oExcel = Nothing
