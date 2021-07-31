@echo off
set inputpath="%~1"
SETLOCAL EnableDelayedExpansion
set w=1920
set fps=25
set /p w="请输入横向分辨率(默认 !w!) ："
echo %w%
set /p fps="请输入每秒帧数(默认 !fps!) ："
echo %fps%
%~dp0/ffmpeg.exe -y -i %inputpath% -b:v 500k -r %fps% -vf scale=%w%:-1 output.mp4
choice /t 3 /d y /n >nul
