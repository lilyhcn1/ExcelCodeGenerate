@echo off
:loop 
echo ----------------------------
echo �������̵Ķ�Ӧ��ϵ��
echo �ļ���������explorer 
echo WPS�ı��et
echo WPS���ĵ���wpsoffice


SETLOCAL EnableDelayedExpansion
set toendexe1= excel
set /p toendexe1="������Ҫ�����Ľ���(Ĭ�� !toendexe1!) ��"
echo ������Ľ���Ϊ�� %toendexe1%
taskkill /IM %toendexe1%* /F
choice /t 3 /d y /n >nul

goto loop