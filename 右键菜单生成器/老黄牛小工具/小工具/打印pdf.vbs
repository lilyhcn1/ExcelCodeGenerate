filename = "D:\×ÀÃæÎÄ¼ş\222.pdf"
Set sh = CreateObject("WScript.Shell")
sh.Run "sumatrapdf.exe -print-to-default """ & filename & """", 0, True