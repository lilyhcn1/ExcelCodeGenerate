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
set oFolder = fs.GetFolder(sFolder)   '获取文件夹
set oSubFolders = oFolder.SubFolders  '获取子目录集合
 

set oFiles = oFolder.Files       '获取文件集合
for each file in oFiles
  sExt = fs.GetExtensionName(file)  '获取文件扩展名
  sExt = LCase(sExt)         '转换成小写
 
  jdlj =   file.path '绝对路径
  name =file.name '文件名
  xgsj=year(file.DateLastModified) & "-" & month(file.DateLastModified) & "-" & day(file.DateLastModified)'format(file.DateLastModified,"yyyy.mm.dd")'修改时间
  dx1=int(file.Size/1024) '"文件大小"
  dx2=cstr(dx1)&"KB"
  kzm=Mid(file.Name, InStrRev(file.Name, ".") + 1, Len(file.Name))'扩展名

  s1=jdlj&""&name&""&xgsj&""&dx2&""&kzm
  
 
  s2 = s1&vbCrLf
      
  s3 = s3+s2
Next
s3="文件："& vbCrLf &s3
MsgBox   vbCrLf & s3
