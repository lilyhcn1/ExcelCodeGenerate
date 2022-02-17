'msgbox("É¸Ñ¡Áí´æ")


On Error Resume Next
' try to connect to et or excel
Set ExcelApp = GetObject(, "Excel.Application")
If ExcelApp Is Nothing Then
    Set ExcelApp = GetObject(, "KET.Application")
    If ExcelApp Is Nothing Then
        Set ExcelApp = GetObject(, "et.Application")
        If ExcelApp Is Nothing Then
            MsgBox "Run Excel or Kingsoft ET first.", vbInformation, "Information"
            wscript.Quit
        End If
    End If
End If


With ExcelApp
'  .Application.ScreenUpdating = False
  .Application.DisplayAlerts = False
  atc = .ActiveCell.Column
  atr = .ActiveCell.Row
  nnfile = .ActiveWorkbook.Path & "\"
  Set sh = .ActiveWorkbook.ActiveSheet
  
  With sh
    ar = .Cells(1, atc).CurrentRegion
    If Not IsArray(ar) Then wscript.Quit
    r = UBound(ar)
    c = UBound(ar, 2)
  End With
  
  Set dic = CreateObject("scripting.dictionary")
  
  For i = atr + 1 To r
    a = ar(i, atc)
    dic(a) = 1
  Next
  
  dr = dic.keys
  r2 = UBound(dr)
  
  Set wb = .Workbooks.Add
  With wb
    With .ActiveSheet
      sh.Cells.Copy .Cells
      .Cells.EntireColumn.AutoFit
      For i = 0 To r2
        n = dr(i)
        sh.Range(sh.Cells(atr, 1), sh.Cells(r, c)).AutoFilter atc, n
        .Range(.Cells(atr + 1, 1), .Cells(r, c)).ClearContents
        sh.Cells(1, 1).CurrentRegion.Copy .Cells(1, 1)
        If Len(n) = 0 Then n = "¿Õ°×"
        wb.SaveAs nnfile & n, 51
      Next
    End With
    .Close
    sh.Range(sh.Cells(atr, 1), sh.Cells(r, c)).AutoFilter
    sh.Range(sh.Cells(atr, 1), sh.Cells(r, c)).AutoFilter
  End With
  .Application.DisplayAlerts = True
 ' .Application.ScreenUpdating = True
End With

Set ExcelApp = Nothing
Set sh = Nothing
Set wb = Nothing
Set dic = Nothing


