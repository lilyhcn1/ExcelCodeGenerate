dim sheetname,rangename
filename="D:\老黄牛小工具\word模板\Excel生成Word增强（docx).xlsm"
sheetname="生成word"
rangename="C11"
newvalue="342342342"
runb="生成Word文件_Click"


  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(filename) '打开工作簿
  
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
  oExcel.run runb
  next  

