Const WINDOW_HANDLE = 0
Const OPTIONS = 0

Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.BrowseForFolder _
(WINDOW_HANDLE, "Select a folder:", OPTIONS)

If objFolder Is Nothing Then
Wscript.Quit
End If

Set objFolderItem = objFolder.Self
objPath = objFolderItem.Path

Dim sFolder, sExt, message
sFolder = objFolderItem.Path
 
Dim fs, oFolder, oFiles, oSubFolders
set fs = CreateObject("Scripting.FileSystemObject")
set oFolder = fs.GetFolder(sFolder)   '��ȡ�ļ���
set oSubFolders = oFolder.SubFolders  '��ȡ��Ŀ¼����
 
for each folder in oSubFolders
  
 k=k & vbCrLf & folder.path
Next
 message = "�ļ��У�" & k
set oFiles = oFolder.Files       '��ȡ�ļ�����
for each file in oFiles
  sExt = fs.GetExtensionName(file)  '��ȡ�ļ���չ��
  sExt = LCase(sExt)         'ת����Сд
 
  s1 = s& file.path
 
  s2 = s1&vbCrLf
      
  s3 = s3+s2
Next
s3="�ļ���"& vbCrLf &s3
MsgBox message & vbCrLf & s3