dim sheetname,rangename
sheetname="Sheet2"
rangename="C3"
newvalue="342342342"


Set oArgs = WScript.Arguments
'��ȡ�������ϴ�����
Set ws=WScript.CreateObject("wscript.shell")
tpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path &"\"
'��õ�ǰ·��
ws.currentdirectory=tpath
'vbs�Ĺ���·����Ϊ��ǰ·��
 
 for each filepathtemp in WScript.Arguments
  c=filepathtemp 
  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(c) '�򿪹�����
  
  for j= 1 to oWb.sheets.count
    if sheetname = oWb.Sheets(j).name  then   '�������Ǵӱ���������ȷ������������ָ����һ�¾ʹ�
    
      Set oSheet = oWb.Worksheets(j) 'Ҫ�޸ĵĹ�����
      oSheet.Range(rangename).Value=newvalue '�޸ĵ�Ԫ������
      oExcel.Application.DisplayAlerts = False
      oExcel.ActiveWorkbook.Save '�ļ�����
      oExcel.ActiveWorkBook.Close  '�ļ��ر�
      'msgbox (c & "�޸ĳɹ�")
      oExcel.Application.DisplayAlerts = True
    end if
  next  
next
msgbox ("ȫ���޸ĳɹ�")