del test.7z
del test.exe

set srcpath=�ϻ�ţС����     //����test�ļ���Ŀ¼���Ե�ַ
echo %srcpath%
7z a test.7z "%srcpath%\*" -r -mx -mf=BCJ2       //��test�ļ����������ļ�ѹ����7z���У�������testĿ¼
copy /b 7zSD.sfx + config.txt + test.7z test.exe