dim xls1,sheetname1,rangename1,newvalue1
dim xls2,sheetname2,rangename2,newvalue2
xls1="̨��ѧԺ������Ϣ���ݿ�2.xlsm"
sheetname1="Sheet1����"
rangename1="F5"
newvalue1="http://api.r34.cc"
macro1="�����ϴ�����"

xls2="̨��ѧԺ������Ϣ���ݿ�2.xlsm"
sheetname2="Sheet1����"
rangename2="F5"
newvalue2="http://tp.r34.cc"
macro2="�����ϴ�����"

Set ws=WScript.CreateObject("wscript.shell")


Ws.Run "D:\�ϻ�ţС����\�ű��ļ�\vbs\EndExcel.vbs",false,false
WScript.Sleep(1000)

tpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path &"\"
'��õ�ǰ·��
ws.currentdirectory=tpath

Function modifycells(xls,sheetname,rangename,newvalue,macro)
  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(xls) '�򿪹�����
  
  for j= 1 to oWb.sheets.count
    if sheetname = oWb.Sheets(j).name  then   '�������Ǵӱ���������ȷ������������ָ����һ�¾ʹ�
    
      Set oSheet = oWb.Worksheets(j) 'Ҫ�޸ĵĹ�����
      oSheet.Range(rangename).Value=newvalue '�޸ĵ�Ԫ������
      oWb.Worksheets(j).Select
      oExcel.Application.DisplayAlerts = False
      oExcel.run macro '���к�
      oExcel.ActiveWorkbook.Save '�ļ�����
      
      oExcel.ActiveWorkBook.Close  '�ļ��ر�
      'msgbox (c & "�޸ĳɹ�")
      oExcel.Application.DisplayAlerts = True
      
      exit for
    end if
  next  
end function
call modifycells(tpath & xls1,sheetname1,rangename1,newvalue1,macro1)
call modifycells(tpath & xls2,sheetname2,rangename2,newvalue2,macro2)


