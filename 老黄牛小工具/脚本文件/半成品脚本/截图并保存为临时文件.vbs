Dim  tempjpg
tempjpg="D:\老黄牛小工具\ExcelQuery\temp\temp.jpg"
'删除临时文件
Set fso = CreateObject("scripting.filesystemobject")
If fso.FileExists(tempjpg) Then
    fso.DeleteFile tempjpg, True
End If

'调用截图程序截图到剪贴板
Set oShell = CreateObject("WSCript.shell")

ret = oShell.Run("D:\老黄牛小工具\小工具\360screener.exe", 1, True)
'把剪贴板的图象保存为jpg文件
exeurl = "D:\老黄牛小工具\小工具\缩小图片nconvert\nconvert.exe -out jpeg -clipboard -overwrite -o " & tempjpg
'Call Shell(exeurl, 0)
ret = oShell.Run(exeurl, 0, True)
'强制关闭截图程序
ret = oShell.Run( "cmd.exe /c /min taskkill /IM 360screener.exe /F",0,True)

