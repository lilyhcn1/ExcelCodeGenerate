Dim  tempjpg
tempjpg="D:\�ϻ�ţС����\ExcelQuery\temp\temp.jpg"
'ɾ����ʱ�ļ�
Set fso = CreateObject("scripting.filesystemobject")
If fso.FileExists(tempjpg) Then
    fso.DeleteFile tempjpg, True
End If

'���ý�ͼ�����ͼ��������
Set oShell = CreateObject("WSCript.shell")

ret = oShell.Run("D:\�ϻ�ţС����\С����\360screener.exe", 1, True)
'�Ѽ������ͼ�󱣴�Ϊjpg�ļ�
exeurl = "D:\�ϻ�ţС����\С����\��СͼƬnconvert\nconvert.exe -out jpeg -clipboard -overwrite -o " & tempjpg
'Call Shell(exeurl, 0)
ret = oShell.Run(exeurl, 0, True)
'ǿ�ƹرս�ͼ����
ret = oShell.Run( "cmd.exe /c /min taskkill /IM 360screener.exe /F",0,True)

