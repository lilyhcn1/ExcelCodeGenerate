rem 图片转视频能用，但不完美
rem 要手动写好个数注意图片格式、个数
@echo off
SETLOCAL EnableDelayedExpansion
set w=1920
set h=1080
set t=5

set inputpath="%~1"
set ffmpegpath=D:/老黄牛小工具/小工具/ffmpeg.exe
set ffmpegurl=http://vps0.upsir.com/lilypub/ffmpeg.exe
set curlpath=D:/老黄牛小工具/ExcelQuery/curl.exe
 
if not exist %ffmpegpath% (
    echo  ----------------------------------------------
    echo %GenFile% 文件不存在，正准备下载，文件很大，请耐心等待！
    echo  ----------------------------------------------
    choice /t 1 /d y /n >nul
    %curlpath% -o %ffmpegpath% %ffmpegurl%
    )
    

set /p w="请输入视频的宽(默认 !w!) ："
echo %w%
set /p h="请输入视频的高(默认 !h!) ："
echo %h%
set /p t="请输入视频间隔(默认 !t!) ："
echo %t%



rem 要修改输入
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 1.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 1.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 2.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 2.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 3.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 3.ts -y
ffmpeg -ss 0 -t %t% -f lavfi -i color=c=0x000000:s=%w%x%h%:r=25  -i 4.png -filter_complex  "[1:v]scale=%w%:%h%[v1];[0:v][v1]overlay=0:0[outv]"  -map [outv] -c:v libx264 4.ts -y
rem 这里的个数也修改
ffmpeg -i "concat:1.ts|2.ts" -c copy -bsf:a aac_adtstoasc -movflags +faststart output.mp4
choice /t 5 /d y /n >nul