
'���·���Ļ�ȡ
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
If colTasks.Exists("���±�") Then
colTasks("���±�").WindowState = 2 '0ԭ�� 1��� 2��С��
End If
objWord.Quit
p.terminate
end if
next



