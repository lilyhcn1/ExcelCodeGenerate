filename = "D:\�����ļ�\222.pdf"
Set sh = CreateObject("WScript.Shell")
sh.Run "sumatrapdf.exe -print-to-default """ & filename & """", 0, True