'
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
Dim oExcel
Set oExcel = CreateObject("Excel.Application")

' 1) ʹExcel�ɼ�
oExcel.Visible = true

' 2) ����Excel������
oExcel.caption = "qyx's vbs"

' 3) ���һ���µĹ�����
Rem eExcel.workBooks.add

' 4) ���Ѵ��ڵĹ�����
 oExcel.workbooks.open("D:\�����ļ�\ɸѡ���\�ٵ�ͨѶ¼.xlsx")

' 5) ���õ�2������ҳΪ�������
oExcel.worksheets(1).activate
' ����
' oExcel.worksheets("").activate
'



Rem https://club.excelhome.net/forum.php?mod=viewthread&tid=1603945&highlight=%B9%A4%D7%F7%B1%ED%B2%F0%B7%D6&mobile=

Dim i%

arr = oExcel.Sheets(1).[a1].CurrentRegion

Set d = CreateObject("scripting.dictionary")

For i = 2 To UBound(arr)
Rem �ӵڶ���ȡ��
If d.exists(arr(i, 5)) Then
Rem �ӵ����� ���
Set d(arr(i, 5)) =oExcel.Union(d(arr(i, 5)), Rows(i))

Else

Set d(arr(i, 5)) =oExcel.Union(Rows("1:2"), Rows(i))
Rem ��һ�� ���� ��ͷ

End If

Next i

For ss = 0 To d.Count - 1

'Workbooks.Add
' 3) ���һ���µĹ�����
oExcel.workBooks.add
With oExcel.ActiveWorkbook

d.items()(ss).Copy .Sheets(1).[a1]
Rem https://m.yisu.com/zixun/403298.html
test = createobject("Scripting.FileSystemObject").GetFolder(".").Path
Rem Wscript.echo test
Rem .SaveAs ThisWorkbook.Path & "/" & d.keys()(ss)
.SaveAs test & "/" & d.keys()(ss)

.Close

End With

Next ss
' ʹ��Ӧ�ó�������quit�����ر�Excel
oExcel.Quit

' �ͷŸö������
Set oExcel = Nothing

