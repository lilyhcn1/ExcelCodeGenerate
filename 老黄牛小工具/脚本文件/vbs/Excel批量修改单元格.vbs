dim sheetname,rangename
sheetname="Sheet2"
rangename="C3"
newvalue="342342342"


Set oArgs = WScript.Arguments
'获取的所有上传参数
Set ws=WScript.CreateObject("wscript.shell")
tpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path &"\"
'获得当前路径
ws.currentdirectory=tpath
'vbs的工作路径设为当前路径
 
 for each filepathtemp in WScript.Arguments
  c=filepathtemp 
  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(c) '打开工作簿
  
  for j= 1 to oWb.sheets.count
    if sheetname = oWb.Sheets(j).name  then   '这两句是从遍历工作表确定工作表名与指定的一致就打开
    
      Set oSheet = oWb.Worksheets(j) '要修改的工作表
      oSheet.Range(rangename).Value=newvalue '修改单元格内容
      oExcel.Application.DisplayAlerts = False
      oExcel.ActiveWorkbook.Save '文件保存
      oExcel.ActiveWorkBook.Close  '文件关闭
      'msgbox (c & "修改成功")
      oExcel.Application.DisplayAlerts = True
    end if
  next  
next
msgbox ("全部修改成功")