@echo off
set inputpath="%~1"
set ffmpegpath=%~dp0/ffmpeg.exe
set ffmpegurl=http://vps0.upsir.com/lilypub/ffmpeg.exe
set curlpath=D:/�ϻ�ţС����/ExcelQuery/curl.exe
 
if not exist %ffmpegpath% (
    echo  ----------------------------------------------
    echo %GenFile% �ļ������ڣ���׼�����أ��ļ��ܴ������ĵȴ���
    echo  ----------------------------------------------
    choice /t 1 /d y /n >nul
    %curlpath% -o %ffmpegpath% %ffmpegurl%
    )
    
SETLOCAL EnableDelayedExpansion
set w=1920
set fps=25
set /p w="���������ֱ���(Ĭ�� !w!) ��"
echo %w%
set /p fps="������ÿ��֡��(Ĭ�� !fps!) ��"
echo %fps%
%~dp0/ffmpeg.exe -y -i %inputpath% -b:v 500k -r %fps% -vf scale=%w%:-1 output.mp4
choice /t 3 /d y /n >nul
