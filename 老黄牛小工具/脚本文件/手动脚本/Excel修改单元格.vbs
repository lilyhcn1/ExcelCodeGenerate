dim xls1,sheetname1,rangename1,newvalue1
dim xls2,sheetname2,rangename2,newvalue2
xls1="台州学院公开信息数据库2.xlsm"
sheetname1="Sheet1配置"
rangename1="F5"
newvalue1="http://api.r34.cc"
macro1="主表上传数据"

xls2="台州学院公开信息数据库2.xlsm"
sheetname2="Sheet1配置"
rangename2="F5"
newvalue2="http://tp.r34.cc"
macro2="主表上传数据"

Set ws=WScript.CreateObject("wscript.shell")


Ws.Run "D:\老黄牛小工具\脚本文件\vbs\EndExcel.vbs",false,false
WScript.Sleep(1000)

tpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path &"\"
'获得当前路径
ws.currentdirectory=tpath

Function modifycells(xls,sheetname,rangename,newvalue,macro)
  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(xls) '打开工作簿
  
  for j= 1 to oWb.sheets.count
    if sheetname = oWb.Sheets(j).name  then   '这两句是从遍历工作表确定工作表名与指定的一致就打开
    
      Set oSheet = oWb.Worksheets(j) '要修改的工作表
      oSheet.Range(rangename).Value=newvalue '修改单元格内容
      oWb.Worksheets(j).Select
      oExcel.Application.DisplayAlerts = False
      oExcel.run macro '运行宏
      oExcel.ActiveWorkbook.Save '文件保存
      
      oExcel.ActiveWorkBook.Close  '文件关闭
      'msgbox (c & "修改成功")
      oExcel.Application.DisplayAlerts = True
      
      exit for
    end if
  next  
end function
call modifycells(tpath & xls1,sheetname1,rangename1,newvalue1,macro1)
call modifycells(tpath & xls2,sheetname2,rangename2,newvalue2,macro2)


