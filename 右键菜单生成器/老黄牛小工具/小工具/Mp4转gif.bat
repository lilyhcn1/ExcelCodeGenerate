set picsize=1200
set nowpath=%~dp0
set inputpath=%1
set ffexe=D:\sharex\ShareX\Tools\ffmpeg.exe
%ffexe% -i "%inputpath%"  "%inputpath%.gif"
pause