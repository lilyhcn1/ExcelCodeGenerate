
' ��� Macro
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'https://www.cnblogs.com/qiyuexin/p/9955792.html
' 2.1 CreateObject Method
'     �﷨��CreateObject(appname.objectType, [servename])
'     ���ͣ�appname, ��Ҫ�� Variant(�ַ���)���ṩ�ö����Ӧ�ó�������
'           objecttype, ��Ҫ��Variant����������������ͻ����ࡣ
'           servename����ѡ��Variant��Ҫ�����ϴ��������������������ơ�
'
'     ˵����Ҫ����ActiveX����ֻ�轫CreateObject���صĶ��󸳸�һ�����������
'     ���ӣ�Set oExcel = CreateObject("Excel.Application")

' ����һ�������������ʹ�ö�̬�������������ö���

Rem Wscript.echo test
Rem .SaveAs ThisWorkbook.Path & "/" & d.keys()(ss)
Dim oExcel
Set oExcel = CreateObject("Excel.Application")

' 1) ʹExcel�ɼ�
oExcel.Visible = true

' 2) ����Excel������
oExcel.caption = "qyx's vbs"

' 3) ���һ���µĹ�����
Rem eExcel.workBooks.add

' 4) ���Ѵ��ڵĹ�����
filePath="D:\�����ļ�\�㱨ppt  202111.11����\ɸѡ���\�ٵ�ͨѶ¼.xlsx"
Rem filePath=document.getElementById("filePath").value
Rem keyColumn=document.getElementById("keyColumn").value
keyColumn=5
set wb=oExcel.workbooks.open(filePath)
currentPath=wb.Path
' 5) ���õ�2������ҳΪ�������
oExcel.worksheets(1).activate
' ����
' oExcel.worksheets("").activate
'



Rem https://club.excelhome.net/forum.php?mod=viewthread&tid=1603945&highlight=%B9%A4%D7%F7%B1%ED%B2%F0%B7%D6&mobile=

Dim i

Rem arr = oExcel.Sheets(1).[a1].CurrentRegion
arr = wb.Sheets(1).[a1].CurrentRegion
set curr_sht=wb.Sheets(1)
Set d = CreateObject("scripting.dictionary")

For i = 2 To UBound(arr)
Rem �ӵڶ���ȡ��
If d.exists(arr(i, keyColumn)) Then
Rem �ӵ����� ���
Set d(arr(i, keyColumn)) =oExcel.Union(d(arr(i, 5)),curr_sht.Rows(i))

Else

Set d(arr(i, keyColumn)) =oExcel.Union(curr_sht.Rows("1:2"),curr_sht.Rows(i))
Rem ��һ�� ���� ��ͷ

End If

Next

For ss = 0 To d.Count - 1

'Workbooks.Add
' 3) ���һ���µĹ�����
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
' ʹ��Ӧ�ó�������quit�����ر�Excel
oExcel.Quit

' �ͷŸö������
Set oExcel = Nothing
