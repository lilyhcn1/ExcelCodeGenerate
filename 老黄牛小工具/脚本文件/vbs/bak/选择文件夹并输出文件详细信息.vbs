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

Dim sFolder, sExt
sFolder = objFolderItem.Path
 
Dim fs, oFolder, oFiles, oSubFolders
set fs = CreateObject("Scripting.FileSystemObject")
set oFolder = fs.GetFolder(sFolder)   '��ȡ�ļ���
set oSubFolders = oFolder.SubFolders  '��ȡ��Ŀ¼����
 

set oFiles = oFolder.Files       '��ȡ�ļ�����
for each file in oFiles
  sExt = fs.GetExtensionName(file)  '��ȡ�ļ���չ��
  sExt = LCase(sExt)         'ת����Сд
 
  jdlj =   file.path '����·��
  name =file.name '�ļ���
  xgsj=year(file.DateLastModified) & "-" & month(file.DateLastModified) & "-" & day(file.DateLastModified)'format(file.DateLastModified,"yyyy.mm.dd")'�޸�ʱ��
  dx1=int(file.Size/1024) '"�ļ���С"
  dx2=cstr(dx1)&"KB"
  kzm=Mid(file.Name, InStrRev(file.Name, ".") + 1, Len(file.Name))'��չ��

  s1=jdlj&""&name&""&xgsj&""&dx2&""&kzm
  
 
  s2 = s1&vbCrLf
      
  s3 = s3+s2
Next
s3="�ļ���"& vbCrLf &s3
MsgBox   vbCrLf & s3
