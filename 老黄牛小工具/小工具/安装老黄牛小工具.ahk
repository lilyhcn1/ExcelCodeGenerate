;----------------0.������--------------------
;UrlDownloadToFile, http://vps0.upsir.com/curlsoft/curl.exe, %A_ScriptDir%\curl.exe
;----------------1.�ϻ�ţС����--------------------
MsgBox, 4,��װ��, �Ƿ�װ�ϻ�ţС���ߣ�����е����������ĵȴ���
IfMsgBox,Yes 
{
  UrlDownloadToFile,http://vps0.upsir.com/�ϻ�ţС����.zip,%A_ScriptDir%\�ϻ�ţС����.zip
  run,%A_ScriptDir%\�ϻ�ţС����.zip
  FileCreateDir, d:\�ϻ�ţС����
  run,d:\�ϻ�ţС����
  Sleep,3000
  msgbox,���϶�ѹ���ļ��� d:\�ϻ�ţС����
}
;----------------�Ҽ��˵�--------------------
MsgBox, 4,��װ��, �Ƿ�װ�Ҽ��˵���(�������Ҫ�Ȱ�װ�ϻ�ţС����)
IfMsgBox,Yes 
{
    run,D:\�ϻ�ţС����\������������Ӧ��\[���ⰲװ]�Ҽ��˵�������\
    Sleep,3000
    run,D:\�ϻ�ţС����\������������Ӧ��\[���ⰲװ]�Ҽ��˵�������\�Ҽ��༶�˵�.reg
    
}




















