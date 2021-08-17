del test.7z
del test.exe

set srcpath=老黄牛小工具     //传递test文件夹目录绝对地址
echo %srcpath%
7z a test.7z "%srcpath%\*" -r -mx -mf=BCJ2       //将test文件夹内所有文件压缩到7z包中，不包含test目录
copy /b 7zSD.sfx + config.txt + test.7z test.exe