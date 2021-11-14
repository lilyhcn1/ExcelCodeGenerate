
'相对路径的获取
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


set pc=getobject("winmgmts:win32_process").instances_
for each p in pc
if p.name="excel.exe" then
Set objWord = CreateObject("Word.Application")
Set colTasks = objWord.Tasks
If colTasks.Exists("记事本") Then
colTasks("记事本").WindowState = 2 '0原样 1最大化 2最小化
End If
objWord.Quit
p.terminate
end if
next



