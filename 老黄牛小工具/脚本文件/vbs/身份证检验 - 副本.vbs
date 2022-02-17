' This code try to connect WPS ET，if failed then connect to Excel
Dim ExcelApp

On Error Resume Next
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
On Error resume next


'功能:检查身份证号码 
Function CheckCardId(e)  
    arrVerifyCode = Split("1,0,x,9,8,7,6,5,4,3,2", ",")  
    Wi = Split("7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2", ",")  
    Checker = Split("1,9,8,7,6,5,4,3,2,1,1", ",")  

    If Len(e) < 15 Or Len(e) = 16 Or Len(e) = 17 Or Len(e) > 18 Then  
        CheckCardId= "身份证号共有 15 码或18位"  
        CheckCardId = False  
        Exit Function  
    End If  

    Dim Ai  
    If Len(e) = 18 Then  
        Ai = Mid(e, 1, 17)  
    ElseIf Len(e) = 15 Then  
        Ai = e  
        Ai = Left(Ai, 6) & "19" & Mid(Ai, 7, 9)  
    End If  

    If Not IsNumeric(Ai) Then  
        CheckCardId= "身份证除最后一位外，必须为数字！"          
        Exit Function  
    End If  
    Dim strYear, strMonth, strDay  
    strYear = CInt(Mid(Ai, 7, 4))  
    strMonth = CInt(Mid(Ai, 11, 2))  
    strDay = CInt(Mid(Ai, 13, 2))  
    BirthDay = Trim(strYear) + "-" + Trim(strMonth) + "-" + Trim(strDay)  
    If IsDate(BirthDay) Then  
        If DateDiff("yyyy",Now,BirthDay)<-140 or cdate(BirthDay)>date() Then          
            CheckCardId= "身份证输入错误！"  
            Exit Function  
        End If  
        If strMonth > 12 Or strDay > 31 Then  
            CheckCardId= "身份证输入错误！"  
            Exit Function  
        End If  
    Else  
        CheckCardId= "身份证输入错误！"  
        Exit Function  
    End If  
    Dim i, TotalmulAiWi  
    For i = 0 To 16  
        TotalmulAiWi = TotalmulAiWi + CInt(Mid(Ai, i + 1, 1)) * Wi(i)  
    Next  
    Dim modValue  
    modValue = TotalmulAiWi Mod 11  
    Dim strVerifyCode  
    strVerifyCode = arrVerifyCode(modValue)  
    Ai = Ai & strVerifyCode   
    CheckCardId = Ai 

    If Len(e) = 18 And e <> Ai Then  
        CheckCardId= "身份证输入错误！"  
        Exit Function  
    End If  
End Function  

With ExcelApp
.Application.DisplayAlerts = False
atc = .ActiveCell.Column
atr = .ActiveCell.Row
r = .Cells(.Rows.Count, atc).End(3).Row

ar = .Range(.Cells(1, 1), .Cells(r, atc))

For i = atr  To r
  nowval=.Cells(i, atc)
  if nowval <> CheckCardId(nowval) then
    .Cells(i, atc).Interior.ColorIndex = 3
   end if
next

.Application.DisplayAlerts = True
End With

Set ExcelApp = Nothing
Set sh = Nothing
Set RegEx = Nothing


