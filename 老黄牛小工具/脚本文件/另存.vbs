' This code try to connect WPS ET，if failed then connect to Excel
Dim ExcelApp

'On Error Resume Next
' try to connect to et or excel
Set ExcelApp = GetObject(, "Excel.Application")
If ExcelApp Is Nothing Then
	Set ExcelApp = GetObject(, "KET.Application")
	If ExcelApp Is Nothing Then
		Set ExcelApp = GetObject(, "et.Application")
		If ExcelApp Is Nothing Then
			MsgBox "Run Excel or Kingsoft ET first.", vbInformation, "Information"
			WScript.Quit
		End If
	End If
End If
On Error Goto 0

newfilename = ExcelApp.ActiveWorkbook.Name
filename = Left(newfilename, InStrRev(newfilename, ".") - 1)
nowpath = ExcelApp.Application.ActiveWorkbook.path
nnfile = nowpath & "\" & filename & ".xlsx"


  Dim i,strtemp,str,ar
  ReDim ar(ExcelApp.Worksheets.Count)
 ' msgbox ExcelApp.Worksheets.Count
  For i = 1 To ExcelApp.Worksheets.Count
    ar(i) = ExcelApp.Worksheets(i).Name
    strtemp =strtemp & """" & ar(i) & """" & " ,"
    'msgbox i & ": "& ar(i)
  Next

str = Left(strtemp, len(strtemp) - 1)
str ="array(" & str & ")"
'msgbox str

'rr=array("sheet1","sheet2","sheet3")   用array就正常，直接 ar就出错
 ExcelApp.Worksheets( Eval(str)).Copy





ExcelApp.Application.DisplayAlerts = False
With ExcelApp.ActiveWorkbook
  For i = 1 To .Worksheets.Count
    .Worksheets(i).DrawingObjects.Delete
  Next
  .SaveAs nnfile, 51
  .Close
End With
ExcelApp.Application.DisplayAlerts = True
