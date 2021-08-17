@echo off
set inputpath="%~1"
set ffmpegpath=%~dp0/ffmpeg.exe
set ffmpegurl=http://vps0.upsir.com/lilypub/ffmpeg.exe
set curlpath=D:/老黄牛小工具/ExcelQuery/curl.exe
 
if not exist %ffmpegpath% (
    echo  ----------------------------------------------
    echo %GenFile% 文件不存在，正准备下载，文件很大，请耐心等待！
    echo  ----------------------------------------------
    choice /t 1 /d y /n >nul
    %curlpath% -o %ffmpegpath% %ffmpegurl%
    )
    
SETLOCAL EnableDelayedExpansion
set w=1920
set fps=25
set /p w="请输入横向分辨率(默认 !w!) ："
echo %w%
set /p fps="请输入每秒帧数(默认 !fps!) ："
echo %fps%
%~dp0/ffmpeg.exe -y -i %inputpath% -b:v 500k -r %fps% -vf scale=%w%:-1 output.mp4
choice /t 3 /d y /n >nul
