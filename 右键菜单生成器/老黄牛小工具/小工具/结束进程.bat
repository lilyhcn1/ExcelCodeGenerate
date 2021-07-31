@echo off
:loop 
echo ----------------------------
echo 常见进程的对应关系：
echo 文件管理器：explorer 
echo WPS的表格：et
echo WPS的文档：wpsoffice


SETLOCAL EnableDelayedExpansion
set toendexe1= excel
set /p toendexe1="请输入要结束的进程(默认 !toendexe1!) ："
echo 你输入的进程为： %toendexe1%
taskkill /IM %toendexe1%* /F
choice /t 3 /d y /n >nul

goto loop