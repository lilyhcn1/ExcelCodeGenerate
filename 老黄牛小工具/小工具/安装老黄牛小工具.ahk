;----------------0.下载器--------------------
;UrlDownloadToFile, http://vps0.upsir.com/curlsoft/curl.exe, %A_ScriptDir%\curl.exe
;----------------1.老黄牛小工具--------------------
MsgBox, 4,安装向导, 是否安装老黄牛小工具？这个有点慢，请耐心等待。
IfMsgBox,Yes 
{
  UrlDownloadToFile,http://vps0.upsir.com/老黄牛小工具.zip,%A_ScriptDir%\老黄牛小工具.zip
  run,%A_ScriptDir%\老黄牛小工具.zip
  FileCreateDir, d:\老黄牛小工具
  run,d:\老黄牛小工具
  Sleep,3000
  msgbox,请拖动压缩文件到 d:\老黄牛小工具
}
;----------------右键菜单--------------------
MsgBox, 4,安装向导, 是否安装右键菜单？(这个必须要先安装老黄牛小工具)
IfMsgBox,Yes 
{
    run,D:\老黄牛小工具\代码生成器的应用\[简单免安装]右键菜单生成器\
    Sleep,3000
    run,D:\老黄牛小工具\代码生成器的应用\[简单免安装]右键菜单生成器\右键多级菜单.reg
    
}




















