dim sheetname,rangename
filename="D:\�ϻ�ţС����\wordģ��\Excel����Word��ǿ��docx).xlsm"
sheetname="����word"
rangename="C11"
newvalue="342342342"
runb="����Word�ļ�_Click"


  dim oExcel,oWb,oSheet
  Set oExcel= CreateObject("Excel.Application")
  Set oWb = oExcel.Workbooks.Open(filename) '�򿪹�����
  
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
  oExcel.run runb
  next  

