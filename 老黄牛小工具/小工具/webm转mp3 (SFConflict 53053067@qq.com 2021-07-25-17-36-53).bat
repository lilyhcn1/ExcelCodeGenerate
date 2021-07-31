set picsize=1200
set nowpath=%~dp0
set inputpath="%~1"
D:\sharex\ShareX\Tools\ffmpeg.exe -i "%inputpath%" -vn -ab 128k -ar 44100 -y "%inputpath%.mp3"
pause