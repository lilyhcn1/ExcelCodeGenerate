rem ͼƬת��Ƶ���ã���������
rem Ҫ�ֶ�д�ø���ע��ͼƬ��ʽ������
@echo off
SETLOCAL EnableDelayedExpansion
set w=1920
set h=1080
set t=5

set inputpath="%~1"
set ffmpegpath=D:/�ϻ�ţС����/С����/ffmpeg.exe
set ffmpegurl=http://vps0.upsir.com/lilypub/ffmpeg.exe
set curlpath=D:/�ϻ�ţС����/ExcelQuery/curl.exe
 
if not exist %ffmpegpath% (
    echo  ----------------------------------------------
    echo %GenFile% �ļ������ڣ���׼�����أ��ļ��ܴ������ĵȴ���
    echo  ----------------------------------------------
    choice /t 1 /d y /n >nul
    %curlpath% -o %ffmpegpath% %ffmpegurl%
    )
    

set /p w="��������Ƶ�Ŀ�(Ĭ�� !w!) ��"
echo %w%
set /p h="��������Ƶ�ĸ�(Ĭ�� !h!) ��"
echo %h%
set /p t="��������Ƶ���(Ĭ�� !t!) ��"
echo %t%



rem Ҫ�޸�����
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 1.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 1.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 2.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 2.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 3.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 3.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 4.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 4.ts -y
rem ����ĸ���Ҳ�޸�
ffmpeg -i "concat:1.ts|2.ts" -c copy -bsf:a aac_adtstoasc -movflags +faststart output.mp4
choice /t 5 /d y /n >nul